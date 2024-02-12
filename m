Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BEE85184E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Feb 2024 16:41:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZYRI-0005do-9z;
	Mon, 12 Feb 2024 15:41:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1rZYRG-0005di-FZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Feb 2024 15:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G0mXhrpRS+p0F3dgHMjFx7EMsz8T+uz8plxGpEvyFag=; b=g6+bpYAwq6Oql8BY5bfyJjrqbj
 aaE+jAMgBHYz9aYoEdLZHBItHKMn3jlqWhdc8r/l8WcPBC0Lex39JUISdw79a8M5+uNnmmhOvlEjE
 +4aBbYqoocTiTHuRzEe8L5rpNcjIdhTGWT52Eaj0pulijEseXVKtVR8GHJSQJoX2LIB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G0mXhrpRS+p0F3dgHMjFx7EMsz8T+uz8plxGpEvyFag=; b=SLLi2N8GH+ROFIbI+tISrMFRTA
 jkD0vFocn6944L2C/6bYjHCZhk4aDx1Jn0j1xHWKwIVv4SSnvEQIrf1wW57w9I06Y73aOLMO0Vy9m
 jbc5AdDh1bo1FGcqztOgwNBFtlSxSMICCbLfQ+0nKNzLGjpSXU1Q9cwLekNkNPSTn8Ng=;
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rZYRD-0003VT-3x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Feb 2024 15:41:46 +0000
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-363f0a9cf87so5403165ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Feb 2024 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1707752498; x=1708357298;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0mXhrpRS+p0F3dgHMjFx7EMsz8T+uz8plxGpEvyFag=;
 b=d3eh+87Id10A66WDmMyHHBk5mBoWnhhZsSwlCu3J4nlG7glaGeczmFakxC0lm3gc+I
 JKq5ZxDL5W9Mu6R+IbB6nFRFvyX9xaWcH2RZ8lyh2oN1GktmN8UJrJY0pTPPDKZRA1Gm
 TSGJQ1GkEhRi3D/bTCU8uTfhonoh9s2W+MleIc2VZZwpaB5DzgVQBpAvurVfpcPYezl1
 BQY1ZuxtYJ55vRBT7T9rndoMjspkBqoQb8RTK76HnrfCpRQ3DRybKMLcbgBrntcdFWlA
 gT1xnJgTHnUnZNh6d/rNlJ8siSp9eWPW6KBGDMpEnAjiEc9Q8yXR02UdHBXt4Dc1Leuj
 FwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707752498; x=1708357298;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0mXhrpRS+p0F3dgHMjFx7EMsz8T+uz8plxGpEvyFag=;
 b=cFzPOUkxPJg+n36butruBaLHAI4EDibwGrBfll5xlgA2WgO1VVA3Z7JmuVTRNI3Zsy
 NnXS0PAxYEPhd2fRGobjqcE6T+C5L9Ny9W6PvnIEdalvA9+T4UV2qd3MrLiBbVHZ3GHl
 602ZMq6SsvNVziuvd6WSyZLdP0j1ezAqL2toj3qhlDeoFiwsJv7EYOQV82lCJBPqJv5N
 y2/aEahVsLHzcikBooLzyBZi1m+9eG10zhTKr9g1zyktcpe8d1V37bk8Y+jIe9jA2hFU
 r9D/OIWztJTdhcYtlTQwPsxs67enpUUHcJChnWN7pRnnO0IS0gFswH5QiErsKFjUHoOb
 7fdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs7h1JMc5yFnzpnyiaZTr1A1BiNDe8ulPMfN1CdlQB7gcvH5q/ae4vHe+CmRxHtbBqhXuj2qJ7PE2n41I0pSSc219hqvWuDshxV1kCtaD2RFWX0VQZdA==
X-Gm-Message-State: AOJu0YwwuwJ64XMkFsT1Lle8GO1H5Oa4FygRKuPL5FZTAF8doKPRdiMw
 4gUxgd6cqGkI10tNlFixL2xNpDK1bVAKP5aISDgzVhgTx5uAVEWNLHxLzYzjUKA=
X-Google-Smtp-Source: AGHT+IEnm3ePbL8fRCn1bW7XxydRwFQeu0nYxrSBLL9n45bkvISdrumwN+YpZk9VT+q4F3sMK0GEkg==
X-Received: by 2002:a05:6602:1235:b0:7c4:4e3d:36ce with SMTP id
 z21-20020a056602123500b007c44e3d36cemr6321073iot.0.1707752498059; 
 Mon, 12 Feb 2024 07:41:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWnVzGOtmdX7AszrJhRBwMaathZlE7sOIhhmBCZ172Waj/mNt1jVoILjXxsGEIpU2TQcVluLp7cNz/UtFbkni0EEdCOEBsy/xjyiNN/ght5OTEHQGRjxcAlTGlfhtrYbg3hw+98adb+8nL6IVMAAdlU5lTU5EMAAbXgYb1397xO6lrjdnnTP69LWHcEoBVSq9uifg1lQQ9Ljz/8jHJ3IKlWa5Mx1nZXHyLPSF1uiYtAt13KF5itfaSyN9/vDJFXPojaV54onxtzBNZLDWpmBUHVv6moas9okmEo0rIUPz456FSRkUNBLBCQlDnRzZMpsaO/RZkw+TBhPRGJA1oLMS5He4v/Ih2pvl6T9uB988xPxT+TKw7HrN6VyXeP2HkOu+x92KwNyb1cX7tCV7BZ8axVukDGWSvzLjHyfNghSq6t5+2VF2GvOLv8pcXWDwCiqCxajdZ8jKz0iLniEYWXEpLOzgVKGnWA5Kl1UiZvYR8PslSJ7A6DIv7vFdsrJOdn/B9UWWWz2VH4LT+taUOVnIfIddOSfNHB78L9qrXbAmYHMPq7wmT7+C8mZQVNJDyqZwF0UBwGVxnx11Jn9i4gYo/B389dXczXZ8oahlKZYLTMuN0na4Xb4SUUEogYLcOT+oFjiYIu7JWMeiTv
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 d62-20020a0285c4000000b0047148f44e27sm1464516jai.2.2024.02.12.07.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 07:41:37 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Chao Yu <chao@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
In-Reply-To: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
Message-Id: <170775249673.1914864.6863373275533824749.b4-ty@kernel.dk>
Date: Mon, 12 Feb 2024 08:41:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.12.5-dev-2aabd
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 28 Jan 2024 23:52:15 -0800, Johannes Thumshirn wrote:
 > Fueled by the LSFMM discussion on removing GFP_NOFS initiated by Willy,
 > I've looked into the sole GFP_NOFS allocation in zonefs. As it [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.182 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.182 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rZYRD-0003VT-3x
Subject: Re: [f2fs-dev] [PATCH v3 0/5] block: remove gfp_mask for
 blkdev_zone_mgmt()
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


On Sun, 28 Jan 2024 23:52:15 -0800, Johannes Thumshirn wrote:
> Fueled by the LSFMM discussion on removing GFP_NOFS initiated by Willy,
> I've looked into the sole GFP_NOFS allocation in zonefs. As it turned out,
> it is only done for zone management commands and can be removed.
> 
> After digging into more callers of blkdev_zone_mgmt() I came to the
> conclusion that the gfp_mask parameter can be removed alltogether.
> 
> [...]

Applied, thanks!

[1/5] zonefs: pass GFP_KERNEL to blkdev_zone_mgmt() call
      commit: 9105ce591b424771b1502ef9836ca7953c3e0af4
[2/5] dm: dm-zoned: guard blkdev_zone_mgmt with noio scope
      commit: 218082010aceb40b5495ebc30028ede6e30ee755
[3/5] btrfs: zoned: call blkdev_zone_mgmt in nofs scope
      commit: d9d556755f16f6af8d1d8ebac38b83a9263394c5
[4/5] f2fs: guard blkdev_zone_mgmt with nofs scope
      commit: 147ec1c60e3273d21ea1f212c6636f231d6d2771
[5/5] block: remove gfp_flags from blkdev_zone_mgmt
      commit: 71f4ecdbb42addf82b01b734b122a02707fed521

Best regards,
-- 
Jens Axboe





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
