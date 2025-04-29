import { Component, OnInit } from '@angular/core';
import { NgChartsModule } from 'ng2-charts';
import { FormsModule } from '@angular/forms';
import { AdminStatisticsService } from '../../core/services/admin-statistics.service';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { faUsers, faCalendarAlt, faDollarSign, faHome, faArrowUp, faArrowDown, faChartLine, faUserFriends, faStar } from '@fortawesome/free-solid-svg-icons';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-analytics-dashboard',
  standalone: true,
  imports: [NgChartsModule, FormsModule, FontAwesomeModule, CommonModule],
  templateUrl: './analytics-dashboard.component.html',
  styleUrls: ['./analytics-dashboard.component.css']
})
export class AnalyticsDashboardComponent implements OnInit {
  // Icons
  faUsers = faUsers;
  faCalendarAlt = faCalendarAlt;
  faDollarSign = faDollarSign;
  faHome = faHome;
  faArrowUp = faArrowUp;
  faArrowDown = faArrowDown;
  faChartLine = faChartLine;
  faUserFriends = faUserFriends;
  faStar = faStar;

// Softer Airbnb-inspired color palette
airbnbColors = {
  primary: '#E05D6F', // Softer pink/red (less vibrant than FF385C)
  secondary: '#F0858B', // Even softer pink
  tertiary: '#6AACAF', // Muted teal
  coral: '#E58E6D', // Softer coral
  teal: '#88C0BD', // Softer teal
  yellow: '#E6C687', // Softer yellow
  charcoal: '#5A5A5A', // Softer dark gray
  mediumGray: '#9C9C9C', // Medium gray
  lightGray: '#F7F7F7', // Light gray background
  white: '#FFFFFF',
  black: '#3A3A3A', // Softer black
  green: '#89B787', // Softer success green
  purple: '#A6848E', // Muted purple
  blue: '#8AA9C5' // Muted blue
};

  selectedPeriod: string = 'monthly';
  selectedYear: number = new Date().getFullYear();
  availableYears: number[] = [2025, 2024, 2023, 2022];

  // Summary metrics with updated colors
  summaryMetrics = [
    {
      title: 'Total Bookings',
      value: '0',
      icon: 'fas fa-calendar-alt',
      iconBgColor: 'bg-blue-100',
      borderColor: 'border-l-blue-500',
      trendValue: '0%',
      trendText: 'vs last period',
      trendIcon: 'fas fa-arrow-up',
      trendColor: 'text-green-500'
    },
    {
      title: 'Total Revenue',
      value: '$0',
      icon: 'fas fa-dollar-sign',
      iconBgColor: 'bg-green-100',
      borderColor: 'border-l-green-500',
      trendValue: '0%',
      trendText: 'vs last period',
      trendIcon: 'fas fa-arrow-up',
      trendColor: 'text-green-500'
    },
    {
      title: 'Active Users',
      value: '0',
      icon: 'fas fa-users',
      iconBgColor: 'bg-purple-100',
      borderColor: 'border-l-purple-500',
      trendValue: '0%',
      trendText: 'vs last period',
      trendIcon: 'fas fa-arrow-up',
      trendColor: 'text-green-500'
    },
    {
      title: 'Avg. Rating',
      value: '0',
      icon: 'fas fa-star',
      iconBgColor: 'bg-yellow-100',
      borderColor: 'border-l-yellow-500',
      trendValue: '0',
      trendText: 'vs last period',
      trendIcon: 'fas fa-arrow-up',
      trendColor: 'text-green-500'
    }
  ];

  // Updated chart configurations with Airbnb colors
  BookingChartData: any;
  BookingChartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'top' as const,
        labels: {
          font: {
            family: 'Inter, sans-serif'
          }
        }
      },
      tooltip: {
        backgroundColor: '#484848', // Charcoal
        titleFont: {
          family: 'Inter, sans-serif',
          size: 14
        },
        bodyFont: {
          family: 'Inter, sans-serif',
          size: 12
        },
        padding: 12,
        cornerRadius: 8,
        displayColors: true,
        intersect: false
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        grid: {
          drawBorder: false,
          color: '#F7F7F7' // Light gray
        },
        ticks: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848' // Charcoal
        }
      },
      x: {
        grid: {
          display: false,
          drawBorder: false
        },
        ticks: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848' // Charcoal
        }
      }
    }
  };

  revenueChartData: any;
  revenueChartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'top' as const,
        labels: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848' // Charcoal
        }
      },
      tooltip: {
        backgroundColor: '#484848', // Charcoal
        titleColor: '#FFFFFF',
        bodyColor: '#FFFFFF',
        titleFont: {
          family: 'Inter, sans-serif',
          size: 14
        },
        bodyFont: {
          family: 'Inter, sans-serif',
          size: 12
        },
        padding: 12,
        cornerRadius: 8,
        displayColors: true,
        intersect: false
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        grid: {
          drawBorder: false,
          color: '#F7F7F7' // Light gray
        },
        ticks: {
          callback: function(value: any) {
            return '$' + value.toLocaleString();
          },
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848' // Charcoal
        }
      },
      x: {
        grid: {
          display: false,
          drawBorder: false
        },
        ticks: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848' // Charcoal
        }
      }
    }
  };

  userRoleChartData: any;
  userRoleChartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'right' as const,
        labels: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848', // Charcoal
          padding: 20,
          usePointStyle: true,
          pointStyle: 'circle'
        }
      },
      tooltip: {
        backgroundColor: '#484848', // Charcoal
        titleColor: '#FFFFFF',
        bodyColor: '#FFFFFF',
        titleFont: {
          family: 'Inter, sans-serif',
          size: 14
        },
        bodyFont: {
          family: 'Inter, sans-serif',
          size: 12
        },
        padding: 12,
        cornerRadius: 8,
        displayColors: false,
        intersect: false
      }
    }
  };

  topHostsChartData: any;
  topHostsChartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'right' as const,
        labels: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848', // Charcoal
          padding: 20,
          usePointStyle: true,
          pointStyle: 'circle'
        }
      },
      tooltip: {
        backgroundColor: '#484848', // Charcoal
        titleColor: '#FFFFFF',
        bodyColor: '#FFFFFF',
        titleFont: {
          family: 'Inter, sans-serif',
          size: 14
        },
        bodyFont: {
          family: 'Inter, sans-serif',
          size: 12
        },
        padding: 12,
        cornerRadius: 8,
        displayColors: false,
        intersect: false
      }
    }
  };

  topRatedListingsChartData: any;
  topRatedListingsChartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    indexAxis: 'y' as const,
    plugins: {
      legend: {
        display: false
      },
      tooltip: {
        backgroundColor: '#484848', // Charcoal
        titleColor: '#FFFFFF',
        bodyColor: '#FFFFFF',
        titleFont: {
          family: 'Inter, sans-serif',
          size: 14
        },
        bodyFont: {
          family: 'Inter, sans-serif',
          size: 12
        },
        padding: 12,
        cornerRadius: 8,
        displayColors: false,
        intersect: false
      }
    },
    scales: {
      x: {
        beginAtZero: true,
        grid: {
          drawBorder: false,
          color: '#F7F7F7' // Light gray
        },
        ticks: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848' // Charcoal
        }
      },
      y: {
        grid: {
          display: false,
          drawBorder: false
        },
        ticks: {
          font: {
            family: 'Inter, sans-serif'
          },
          color: '#484848' // Charcoal
        }
      }
    }
  };

  constructor(private statsService: AdminStatisticsService) {}

  ngOnInit(): void {
    this.loadAllCharts();
    this.loadSummaryMetrics();
  }

  loadAllCharts(): void {
    this.loadBookingsChart();
    this.loadRevenueChart();
    this.loadUserRolesChart();
    this.loadTopHostsChart();
    this.loadTopRatedListingsChart();
  }

  loadSummaryMetrics(): void {
    // In a real app, you would fetch this data from your service
    // This is just mock data for demonstration
    this.statsService.getSummaryMetrics(this.selectedPeriod, this.selectedYear).subscribe(data => {
      this.summaryMetrics = [
        {
          title: 'Total Bookings',
          value: data.totalBookings.toLocaleString(),
          icon: 'fas fa-calendar-alt',
          iconBgColor: 'bg-blue-100',
          borderColor: 'border-l-blue-500',
          trendValue: data.bookingTrend.value + '%',
          trendText: 'vs last period',
          trendIcon: data.bookingTrend.direction === 'up' ? 'fas fa-arrow-up' : 'fas fa-arrow-down',
          trendColor: data.bookingTrend.direction === 'up' ? 'text-green-500' : 'text-red-500'
        },
        {
          title: 'Total Revenue',
          value: '$' + data.totalRevenue.toLocaleString(),
          icon: 'fas fa-dollar-sign',
          iconBgColor: 'bg-green-100',
          borderColor: 'border-l-green-500',
          trendValue: data.revenueTrend.value + '%',
          trendText: 'vs last period',
          trendIcon: data.revenueTrend.direction === 'up' ? 'fas fa-arrow-up' : 'fas fa-arrow-down',
          trendColor: data.revenueTrend.direction === 'up' ? 'text-green-500' : 'text-red-500'
        },
        {
          title: 'Active Users',
          value: data.activeUsers.toLocaleString(),
          icon: 'fas fa-users',
          iconBgColor: 'bg-purple-100',
          borderColor: 'border-l-purple-500',
          trendValue: data.userTrend.value + '%',
          trendText: 'vs last period',
          trendIcon: data.userTrend.direction === 'up' ? 'fas fa-arrow-up' : 'fas fa-arrow-down',
          trendColor: data.userTrend.direction === 'up' ? 'text-green-500' : 'text-red-500'
        },
        {
          title: 'Avg. Rating',
          value: data.avgRating.toFixed(1),
          icon: 'fas fa-star',
          iconBgColor: 'bg-yellow-100',
          borderColor: 'border-l-yellow-500',
          trendValue: data.ratingTrend.value.toFixed(1),
          trendText: 'vs last period',
          trendIcon: data.ratingTrend.direction === 'up' ? 'fas fa-arrow-up' : 'fas fa-arrow-down',
          trendColor: data.ratingTrend.direction === 'up' ? 'text-green-500' : 'text-red-500'
        }
      ];
    });
  }

  loadBookingsChart(): void {
    this.statsService.getNewBookingsVsCancellations(this.selectedPeriod, this.selectedYear).subscribe(data => {
      this.BookingChartData = {
        labels: data.labels,
        datasets: [
          {
            label: 'New Bookings',
            data: data.newBookingsData,
            borderColor: this.airbnbColors.primary, // Main Airbnb pink/red
            backgroundColor: 'rgba(255, 56, 92, 0.1)', // Transparent Airbnb pink
            borderWidth: 2,
            borderRadius: 4,
            tension: 0.4,
            fill: true
          },
          {
            label: 'Cancellations',
            data: data.cancellationsData,
            borderColor: this.airbnbColors.charcoal, // Airbnb charcoal
            backgroundColor: 'rgba(72, 72, 72, 0.1)', // Transparent charcoal
            borderWidth: 2,
            borderRadius: 4,
            tension: 0.4,
            fill: true
          }
        ]
      };
    });
  }

  loadRevenueChart(): void {
    this.statsService.getRevenue(this.selectedPeriod, this.selectedYear).subscribe(data => {
      // Revenue Chart
      this.revenueChartData = {
        labels: data.labels,
        datasets: [
          {
            label: 'Revenue',
            data: data.revenue,
            borderColor: this.airbnbColors.teal, // Airbnb teal
            backgroundColor: 'rgba(0, 166, 153, 0.1)', // Transparent teal
            borderWidth: 2,
            tension: 0.4,
            fill: true,
            pointBackgroundColor: this.airbnbColors.teal,
            pointBorderColor: this.airbnbColors.white,
            pointHoverRadius: 6,
            pointHoverBorderWidth: 2
          }
        ]
      };
    });
  }

  loadUserRolesChart(): void {
    this.statsService.getUserDistribution().subscribe(data => {
      this.userRoleChartData = {
        labels: data.roles,
        datasets: [
          {
            label: 'User Roles',
            data: data.counts,
            backgroundColor: [
              this.airbnbColors.primary, // Main pink
              this.airbnbColors.teal,    // Teal
              this.airbnbColors.coral,   // Coral
              this.airbnbColors.yellow   // Yellow
            ],
            borderColor: this.airbnbColors.white,
            borderWidth: 2,
            hoverOffset: 10
          }
        ]
      };
    });
  }

  loadTopHostsChart(): void {
    this.statsService.getTopHosts(this.selectedYear).subscribe(data => {
      this.topHostsChartData = {
        labels: data.hosts,
        datasets: [
          {
            label: 'Bookings',
            data: data.bookingCounts,
            backgroundColor: [
              this.airbnbColors.primary, // Main pink
              this.airbnbColors.secondary, // Lighter pink
              this.airbnbColors.teal,   // Teal
              this.airbnbColors.coral,  // Coral
              this.airbnbColors.purple  // Purple
            ],
            borderColor: this.airbnbColors.white,
            borderWidth: 2,
            hoverOffset: 10
          }
        ]
      };
    });
  }

  loadTopRatedListingsChart(): void {
    this.statsService.getTopRatedListings(this.selectedYear).subscribe(data => {
      this.topRatedListingsChartData = {
        labels: data.listingName,
        datasets: [
          {
            label: 'Rating',
            data: data.rating,
            backgroundColor: [
              'rgba(255, 56, 92, 0.85)',  // Primary pink with opacity
              'rgba(252, 100, 45, 0.85)', // Coral with opacity
              'rgba(0, 166, 153, 0.85)',  // Teal with opacity
              'rgba(255, 180, 0, 0.85)',  // Yellow with opacity
              'rgba(145, 70, 105, 0.85)'  // Purple with opacity
            ],
            borderColor: this.airbnbColors.white,
            borderWidth: 1,
            borderRadius: 8
          }
        ]
      };
    });
  }

  onPeriodChange(): void {
    this.loadAllCharts();
    this.loadSummaryMetrics();
  }
}
