                        @if(isset($order))
                    <div class="tracking-steps-area">

                            <ul class="tracking-steps">
                                @foreach($order->tracks as $track)
                                    <li class="{{ in_array($track->title, $datas) ? 'active' : '' }}">
                                        <div class="icon">{{ $loop->index + 1 }}</div>
                                        <div class="content">
                                                <h4 class="title">{{ ucwords($track->title)}}</h4>
                                                <p class="date">{{ date('d m Y',strtotime($track->created_at)) }}</p>
                                                <p class="details">{{ $track->text }}</p>
                                        </div>
                                    </li>
                                @endforeach

                                </ul>
                    </div>


                        @else 
                        <h3 class="text-center">{{ $langg->lang775 }}</h3>
                        @endif          