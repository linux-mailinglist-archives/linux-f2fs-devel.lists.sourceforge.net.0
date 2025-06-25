Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05405AE8886
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 17:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l34CY1ijBb2ZaxpWKcLn9PDX31dB7xv5+YLZrUfeGg=; b=C4O/9WZCiMyCRObfpokMg7sTk6
	6YMauv3CJ71ktgYCpDrv74Xg/L+9WPW7neb6EpggkF8uhphxuLf6ryfe7Z5pwUrWINV7XH5Otl7l0
	m4yiXipC9zNPSIoHPp8Gv1wyUZ73phXyc104yxg5luzJnhco2ugDgTbujcP2J9emZ6Ts=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUSJC-0003yw-Eh;
	Wed, 25 Jun 2025 15:45:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundanthebest@gmail.com>) id 1uUSJA-0003yp-VM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 15:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iocf3xZEV33qVQt+76WbLL52e+K++YTQHmhfnQovIf0=; b=NPqdTF7tyLlgujz3U6JcseOyHQ
 QX57ZIN/NOdbj1+HUBcttHV/6uOVKESxfDSdgkG08AZ+V7Pbir4YlzttQl7G3O0KWg3vCz/Z9R+Mf
 YhUok39Ez7utBKrCizqsYdW4zVKBbXdM/lXb3VAn+2EB+P7X97LUB03hSbfq03ff+1X8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iocf3xZEV33qVQt+76WbLL52e+K++YTQHmhfnQovIf0=; b=SF8lEhGyJAnJXDPFqNG7t5ZQrG
 BIRBD/vvyJezwrXgMjeLMKZhvdVPfVGvK8FR7XJUR6cCmAxSBCk0u1kV1wG4W/eCNSJkZJnZ6zbqn
 6IEgZOkwa8hqccqttE5vbaeS/27wwWBWYCxwwyDCZYPoXadbHePOCdGOyOZdWjVRj4Yg=;
Received: from mail-ej1-f46.google.com ([209.85.218.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uUSJA-0000Nu-LQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 15:45:08 +0000
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso5595066b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Jun 2025 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750866302; x=1751471102; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iocf3xZEV33qVQt+76WbLL52e+K++YTQHmhfnQovIf0=;
 b=OLVCJ5tPVmZnB4ICoYyatarVI4pEfw5DE9IF5ShQYC/GEeqHnGbzH+4KVvsyC/Prfs
 s6Imthqjn/N2YJpTeGbmlYs/1ZTveDmhtj8hc24gaWQCcPcRrDPrq2A6aCHSpuYO5fgE
 aqBgbc3I81XnMoz2UoIUtHfuD1mhLR41g4uCweh2gN9UP1GkhDv4t+8ONkaSgtiAaSDB
 5PFRVthPTGH/QdGhEkGkx2uxxLrD3SQpWl0ZKDUp9gAoRpMID07EGByLEpIFefUwSPY9
 C84+gJStDiOBO8gGponUFZsg4ndJXxV/C0Og3kVL8zcBSyEQgrE3GJrtPnBiKRU9ePSM
 wLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750866302; x=1751471102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iocf3xZEV33qVQt+76WbLL52e+K++YTQHmhfnQovIf0=;
 b=IwjoCPTaBQa0pIT4iT1NMkftIUTU0fShbluG5ER133CNmUTCQBoz4Wm1qKqFcrlA50
 +EpJxOW27kz+4iDiP1PAD7yzNP1xGwyCBnWkZFI0nMkMYCy0llEUHW9Q1lQGUoOvOTCP
 VFCigUxEMYrOxxPNm/Jb6DvErnaaGPHzcRl6jjAhQrZXTpMW+WM3CBM+mGAqfn76Ek1t
 dX3yrvoeeKgBGaGJxSfCdR9hmO5i4+SruifixrYx1wIL5dmfCu/BhFRhizbaIHO3Rj+B
 ii3OrpGEXr235baqhbHrnccUkKy9iqNovklHcT+VpRbtZo6xV+lV9MlvHsxAL9/NSB9B
 c3tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1xEb9LqJY4yAaZv3ynd9zDeR7ySrK4xHJ49lTuTqDaucps62jyjOYOK5Wd5J5F39t6kd4+bdV9+7elTEDZ+zE@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyawRsUTAvd6GQ9lMHu2A/caXD30m/Q6JCzjxIdk9I2TbYE3OMj
 +o6DkEd2784NE6xwVnhZHmL3h4HV1H5/w0aDmILU0XwqN5knsfYoGyNZojce2YKguoadbMRc6KH
 AW+bI1u+ErsuRtpybCambpyFLkoy/rVs=
X-Gm-Gg: ASbGncueSFL8/aw05Qlf4dfNiinODlA31OlmOPkOwwyWrmW/kOy1ijzpU1CWlYGEfRQ
 17rnRpB2fe0645XGsNUgaPhjjFsrl6ptMmOFbR9U6gnslZ+/651zj0MRU07TNd7/i0+vNjm5AVL
 gWTHHVIvwvHHhAekT+GRM7KOxprqnjklrYpvPj9Zq2yIaV
X-Google-Smtp-Source: AGHT+IFs+V/EDFHaGKcJwU9/xkWCRRHAYQqa7LBSGKtKl48ykcDE4Nb840e4+FWhpIDCiq8jKWE842faRWDZOh7ThxM=
X-Received: by 2002:a17:907:97cd:b0:ad8:8529:4f9b with SMTP id
 a640c23a62f3a-ae0bed82d81mr354973966b.38.1750866301696; Wed, 25 Jun 2025
 08:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
In-Reply-To: <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
From: Kundan Kumar <kundanthebest@gmail.com>
Date: Wed, 25 Jun 2025 21:14:51 +0530
X-Gm-Features: Ac12FXz-WfD7KDK7gS4t-j71iOt-puRRwIJfu8WaOkNNWXA_hJ1q0mugrvCoDS0
Message-ID: <CALYkqXqs+mw3sqJg5X2K4wn8uo8dnr4uU0jcnnSTbKK9F4AiBA@mail.gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > > Makes sense. It would be good to test this on a non-SMP
 machine, if > you can find one ; ) > Tested with kernel cmdline with maxcpus=1.
 The parallel writeback falls back to 1 thread behavior, showing nochange
 in BW. Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kundanthebest(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uUSJA-0000Nu-LQ
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 hch@lst.de, dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, linux-nfs@vger.kernel.org, da.gomez@samsung.com,
 viro@zeniv.linux.org.uk, jaegeuk@kernel.org, axboe@kernel.dk,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 anna@kernel.org, gost.dev@samsung.com, linux-fsdevel@vger.kernel.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>
> Makes sense.  It would be good to test this on a non-SMP machine, if
> you can find one ;)
>

Tested with kernel cmdline with maxcpus=1. The parallel writeback falls
back to 1 thread behavior, showing nochange in BW.

  - On PMEM:
    Base XFS        : 70.7 MiB/s
    Parallel Writeback XFS    : 70.5 MiB/s
    Base EXT4        : 137 MiB/s
    Parallel Writeback EXT4    : 138 MiB/s

  - On NVMe:
    Base XFS        : 45.2 MiB/s
    Parallel Writeback XFS    : 44.5 MiB/s
    Base EXT4        : 81.2 MiB/s
    Parallel Writeback EXT4    : 80.1 MiB/s

>
> Please test the performance on spinning disks, and with more filesystems?
>

On a spinning disk, random IO bandwidth remains unchanged, while sequential
IO performance declines. However, setting nr_wb_ctx = 1 via configurable
writeback(planned in next version) eliminates the decline.

echo 1 > /sys/class/bdi/8:16/nwritebacks

We can fetch the device queue's rotational property and allocate BDI with
nr_wb_ctx = 1 for rotational disks. Hope this is a viable solution for
spinning disks?

  - Random IO
    Base XFS        : 22.6 MiB/s
    Parallel Writeback XFS    : 22.9 MiB/s
    Base EXT4        : 22.5 MiB/s
    Parallel Writeback EXT4    : 20.9 MiB/s

  - Sequential IO
    Base XFS        : 156 MiB/s
    Parallel Writeback XFS    : 133 MiB/s (-14.7%)
    Base EXT4        : 147 MiB/s
    Parallel Writeback EXT4    : 124 MiB/s (-15.6%)

-Kundan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
