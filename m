Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A38337B0692
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Sep 2023 16:19:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qlVOF-0003AA-PG;
	Wed, 27 Sep 2023 14:19:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1qlVOE-0003A1-Hk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Sep 2023 14:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wwk46okUDVQfnnelgDDAXJI2PyNHcNwKe3ka13udWbU=; b=F3e7v4VTnCGgZlznK3gUS+9xAf
 hxwnZbHr/RPvGO5O1OmV0BUldHnyJRW0diGyHZKBpKMmK7K5d85ACX5Sl5NUtRhwo9DBZTN3KCjv9
 W2tNcVCfhP51PlCMfIrpGGy5SuFe/CfHOPZ3h68aSp+SzlWXOgyOCBq6wr4Ap/BrgjmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wwk46okUDVQfnnelgDDAXJI2PyNHcNwKe3ka13udWbU=; b=mMPn9tzxeN8DAeeV7FDmL86I7R
 8V9oHDp0lH2AuL4cV2bWVErkj8oXdlkp9Qh3ISJT0FBBx6lSsKSiPx46sOkZyY1gnPJwGmlb2jMo/
 OgCa4ginbAs3T9RoRMi4VNvGoWPIlymIr+5hNhkAgRFlVy0DbPH6MV2K29kMvREOUgAk=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qlVOD-0003F5-Bp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Sep 2023 14:19:46 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2c18b0569b6so549041fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Sep 2023 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1695824379; x=1696429179;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Wwk46okUDVQfnnelgDDAXJI2PyNHcNwKe3ka13udWbU=;
 b=gEH4q0TXDnaerM0Wp6MBsp/6xRkzWtVDEGzUXoZ856EKWdwbjPL8F7zYRg/kvhZEdX
 Vbfel2hD2KIOe060FCMCSVgoN3GO6VSsfT++UR614dZQCOnaOn2T+5AR4e86COg/eBVR
 w6P6HnS5EdJ6s5FLPKeg4eZ4cZBLcDU6hy0hXO7V2/nOwCBgn3JbHWwEqIixz6+BIMSC
 uAU3OSLk8+tOjZ+VuAzoo3evoGgYidCmjePHf7YfnubDB1A/+dqeXU1LEAggiCgmqX7l
 Y0+UOsO3vYABJo2kq3QokbqQzef7DMFya+DmpxC5t/9ZBWxBfZxGABHgCKcoUPJO4opq
 rQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695824379; x=1696429179;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wwk46okUDVQfnnelgDDAXJI2PyNHcNwKe3ka13udWbU=;
 b=nBLEhS2A0mDrqBEp5nW3WXdKzcb4RuNlTg/P3+VnPOrgPu4m7Eg1IsQunpWZwayubi
 GA6mJ74ZpX3Qf++hj3ttU2dk9oEBHQ9tCFqjtzYjJ9UM9wmUQ7qP6LJ4Wevd/rrvU2i6
 TNejZfv36Gs/wrFFEkyTL9rvmPJBB3X8i7aSr9loajQ+6UShdpJkdHEieGvEW1CK0eis
 UoeYT4R0JYYYcIWVi+gCQx6iCUzxhn2+oIbO2FYRgjYFezutPLEu1+vb160lJ6HQ9+y8
 rlI3M0Q2D7TMYDpeCfbVzeVkbIYAdmwWCaYmrF8VJDhRlV5qRC5GazzkKdJLi7932+zt
 P8Cg==
X-Gm-Message-State: AOJu0YyOAUC+3tv4MZum4DetGvjlQusM6yyHo9QtjgfUMz5bwVVEer0c
 8170YsGVWlHSbNTzTWnlfLK3vQ==
X-Google-Smtp-Source: AGHT+IExVCqrFIxKzo43T8FMa/9T5rz6/xdccYRyI4cqxFk27k3RqgKqbk6x0v1Y5TMyg8NtKFdEkg==
X-Received: by 2002:a05:651c:3cf:b0:2b6:cd7f:5ea8 with SMTP id
 f15-20020a05651c03cf00b002b6cd7f5ea8mr1801740ljp.1.1695824378667; 
 Wed, 27 Sep 2023 07:19:38 -0700 (PDT)
Received: from [172.20.13.88] ([45.147.210.162])
 by smtp.gmail.com with ESMTPSA id
 mh2-20020a170906eb8200b00992b2c55c67sm9370253ejb.156.2023.09.27.07.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 07:19:37 -0700 (PDT)
Message-ID: <9cc59d88-4b77-4e56-ae54-737baca1d435@kernel.dk>
Date: Wed, 27 Sep 2023 08:19:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
To: Jan Kara <jack@suse.cz>
References: <20230818123232.2269-1-jack@suse.cz>
Content-Language: en-US
In-Reply-To: <20230818123232.2269-1-jack@suse.cz>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 27,
 2023 at 3:34?AM Jan Kara <jack@suse.cz> wrote:
 > > Hello, > > this is a v3 of the patch series which implements the idea
 of blkdev_get_by_*() v4? > calls returning bdev_handle which is then passed
 to blkdev_put() [1]. This > makes the get and put calls for bdevs more
 obviously
 matching and allows us to > propagate context from get to put withou [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.174 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.174 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qlVOD-0003F5-Bp
Subject: Re: [f2fs-dev] [PATCH v4 0/29] block: Make blkdev_get_by_*() return
 handle
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-nvme@lists.infradead.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jack Wang <jinpu.wang@ionos.com>,
 Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Gao Xiang <xiang@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>,
 linux-nfs@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Ted Tso <tytso@mit.edu>, linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 27, 2023 at 3:34?AM Jan Kara <jack@suse.cz> wrote:
>
> Hello,
>
> this is a v3 of the patch series which implements the idea of blkdev_get_by_*()

v4?

> calls returning bdev_handle which is then passed to blkdev_put() [1]. This
> makes the get and put calls for bdevs more obviously matching and allows us to
> propagate context from get to put without having to modify all the users
> (again!). In particular I need to propagate used open flags to blkdev_put() to
> be able count writeable opens and add support for blocking writes to mounted
> block devices. I'll send that series separately.
>
> The series is based on Btrfs tree's for-next branch [2] as of today as the
> series depends on Christoph's changes to btrfs device handling.  Patches have
> passed some reasonable testing - I've tested block changes, md, dm, bcache,
> xfs, btrfs, ext4, swap. More testing or review is always welcome. Thanks! I've
> pushed out the full branch to:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
>
> to ease review / testing. Christian, can you pull the patches to your tree
> to get some exposure in linux-next as well? Thanks!

For the block bits:

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
