Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 828D28416D5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 00:29:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUb42-00065D-Qu;
	Mon, 29 Jan 2024 23:29:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rUb42-000656-0W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 23:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D83Z1TgXr31js2p6hI1zS+YzHi5LXM+rdoPNxIRJxWU=; b=K75+maeWGRC4KTP2TG/UBrDYvK
 qeQ1/AhAAk1iv+iNCJMXskx6U1cTeQNVyy2/iPp8bq6Ky9i1+bXuhAsPYLVWBPloybxQTT0N+AQ0o
 W/GBk1Hsh+ye8jZ5uqLc7/9kYihjUsND53STxIo3ZaM4eO3LLhG8s5S3f6I7c4OSXZcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D83Z1TgXr31js2p6hI1zS+YzHi5LXM+rdoPNxIRJxWU=; b=lg7LddshQS+Lb7CFH0g1GYtSEE
 SxACrQfIOF1x7UROw+9ydS2x4UtzFT01EWVAJZJ1l7MuOLEM/DLNnxm+57Uwc3MpdqarH6BOjkXcb
 6RlsI4y+kWjUkYbzWdTSBK++YY8AYEbdcHk0nTSY2HbsW+4MKJ6oLNxTENeM0Bt3dYZE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUb41-0007dC-MS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 23:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB9116239D;
 Mon, 29 Jan 2024 23:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E688AC433C7;
 Mon, 29 Jan 2024 23:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706570947;
 bh=ndf2vLbvZIQYQNE9pREjH50tsvV7CWwMiqHG6sTVNIc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JpBD0pkApJsK1Lg9ekUAGkwlA0Sbgqlz2H8WvXFr8iKhHM0b0IKbSZ6wD1tcoj01C
 DAovaEmy1aQXXzXMi2eQqUicPt4RfmG+am5adv7Qi73Q/sVjaPYxdHLM/Rpp9YOQON
 YTdmRNVd6ARkl6PESrOQRGLy3l7DrYzuvUwDAYFGOee7U+d69xlAmHUwcC6ekt+ocA
 V3sVhjRDUyF3KKAXV5sARfdzPALFpWl/tHwOykZZOkrIIIvezVsidD0NjebjuOmDUV
 +my52WioNda7fDaQyJSmIRUSaQKuHEje67Ngc6C13QyBYk96LdB9iPoJR7+jxg8N7w
 bB/k4NsdipxfQ==
Message-ID: <100af933-2253-45df-9045-5bd8e273df12@kernel.org>
Date: Tue, 30 Jan 2024 08:29:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
 <20240128-zonefs_nofs-v3-5-ae3b7c8def61@wdc.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240128-zonefs_nofs-v3-5-ae3b7c8def61@wdc.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/29/24 16:52, Johannes Thumshirn wrote: > Now that all
 callers pass in GFP_KERNEL to blkdev_zone_mgmt() and use > memalloc_no{io,
 fs}_{save, restore}()
 to define the allocation scope, we can > drop [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUb41-0007dC-MS
Subject: Re: [f2fs-dev] [PATCH v3 5/5] block: remove gfp_flags from
 blkdev_zone_mgmt
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
Cc: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/29/24 16:52, Johannes Thumshirn wrote:
> Now that all callers pass in GFP_KERNEL to blkdev_zone_mgmt() and use
> memalloc_no{io,fs}_{save,restore}() to define the allocation scope, we can
> drop the gfp_mask parameter from blkdev_zone_mgmt() as well as
> blkdev_zone_reset_all() and blkdev_zone_reset_all_emulated().
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

But let me check zonefs (patch 1).

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
