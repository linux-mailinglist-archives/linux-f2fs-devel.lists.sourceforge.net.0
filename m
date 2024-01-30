Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C7E842EBB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 22:40:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUvqA-0006Dy-3G;
	Tue, 30 Jan 2024 21:40:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <msnitzer@redhat.com>) id 1rUvq8-0006Dr-K1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 21:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5wxvZziXbUhtUP1Y9zXw54fZ6cDdnya/SKk+UDHGEFo=; b=HUUHkSoONABjnhbaMDsv1jsGC5
 H/oNfk0mdiRYIrm12/dwuEn1uJo7+5hK+MI1k+T+/U6p15wYGBOqNecbggTlLCWd1TOY+um4M4DTi
 VCgA5Lw1mbVLyERkFkkMhSjECPF33yLcmuJxv+JvSd5J7b1KhkTQLqoBp6GRkqPXLeGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5wxvZziXbUhtUP1Y9zXw54fZ6cDdnya/SKk+UDHGEFo=; b=XJbFUK/w4kOIxBWL5vD79Tf0jB
 UTT0EARpSf5MVO7qpInVIvgSyOrq5fyYrIuUFosICOLLRnbDHtGrzN+Mk7rc5DIrl1Q/JQCvRMoyd
 i/s9xpJ6BTfI43D5C4MJ/5OQ8A6d0bdp2KZBMuHfLJTB//dRv0YVG0j3HaW6oKep3IO4=;
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUvq6-0003Iw-PJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 21:40:21 +0000
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-42aa4a9d984so29320811cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jan 2024 13:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706650808; x=1707255608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wxvZziXbUhtUP1Y9zXw54fZ6cDdnya/SKk+UDHGEFo=;
 b=Zq3vWGzrPmxoeumEmJnxYF5fH0rgfICbVFt/qco+ESZUVRVEvK/rvPIjns+EXbXdEg
 KMuo0eT0ewkZygbLPrS9e4BfkMRMt/pd7GWL53We4MGuQ4ao6r2jAEIo2b807JOskqmY
 imXkaUwY3f69hMn4FvjizE85ZZZEgGAZYOHpVA+KmBuDKlBYZTbb5nDOu8oCL9VGgPTo
 cnT0X0pjCqRv8fyNOVSojfW134zM6P8WPzwqwFyIqslKkODTe/UeSetCjlGm+LiVRwq+
 EjfcVsH/LTwmhA91a23MO5bhCWFwKuJft3JUgLqPUuIjH0wLHZs/RBtwlLb3xL60Drhu
 XRWA==
X-Gm-Message-State: AOJu0Yyu55RaYPtJkXfI5jGNifO6KcfO8oC2yNn1gTCMAlQwzKuGbqC+
 jTl/qi3EcSlAkHOUe6UGWzFSmbkGpmDlXnj7mvVy8iXuJNzAPP0f/BWYKJx+LE7APbtXzDEfAkD
 sqQ==
X-Google-Smtp-Source: AGHT+IH5S9pyQeSM2K6WGjuq7LBNmUE3HoawjAO33JauM5M9qFYAUZROQj6Nk22MOXOq+8oUsCH3ng==
X-Received: by 2002:ac8:7f8a:0:b0:42a:b37f:4a75 with SMTP id
 z10-20020ac87f8a000000b0042ab37f4a75mr3021041qtj.16.1706647719211; 
 Tue, 30 Jan 2024 12:48:39 -0800 (PST)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net.
 [68.160.141.91]) by smtp.gmail.com with ESMTPSA id
 x4-20020ac81204000000b00429bd898838sm4160126qti.47.2024.01.30.12.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 12:48:38 -0800 (PST)
Date: Tue, 30 Jan 2024 15:48:37 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Message-ID: <ZblgpVdHZqPaq7xD@redhat.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
 <20240128-zonefs_nofs-v3-2-ae3b7c8def61@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240128-zonefs_nofs-v3-2-ae3b7c8def61@wdc.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 29 2024 at 2:52P -0500,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
 wrote: > Guard the calls to blkdev_zone_mgmt() with a memalloc_noio scope.
 > This helps us getting rid of the GFP_NOIO argument to blkdev_zone_mgmt();
 > > Signed-off-by: Johannes Thumshirn <johannes.thumshir [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUvq6-0003Iw-PJ
Subject: Re: [f2fs-dev] [PATCH v3 2/5] dm: dm-zoned: guard blkdev_zone_mgmt
 with noio scope
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, dm-devel@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Chaitanya Kulkarni <kch@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>, linux-fsdevel@vger.kernel.org,
 linux-block@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 29 2024 at  2:52P -0500,
Johannes Thumshirn <johannes.thumshirn@wdc.com> wrote:

> Guard the calls to blkdev_zone_mgmt() with a memalloc_noio scope.
> This helps us getting rid of the GFP_NOIO argument to blkdev_zone_mgmt();
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Mike Snitzer <snitzer@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
