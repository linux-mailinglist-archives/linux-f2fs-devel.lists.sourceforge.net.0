Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BAC22731E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 01:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=to95fzJO7SD4NPoyVQ5HV4xEjhhcJ/wxTpC23tuX9TU=; b=h+O7W4Y1+keNy80Qg46SrZpZK
	6rxUSwlYT1JhhFSRp3wXJ+A9ZQ+jkYYUGaxfuDRfusWDcRWMGuq/xwvpv1vbRTCpyoDGbNRUGKubv
	f/c2QrMryi8ROAWJJWETsntFuFY1u1M6HzjGKGrMIzbhVhDx5MqmwGTQMs+IGRHNdAvfY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxfM6-0006lt-J1; Mon, 20 Jul 2020 23:37:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3zioWXwYKAHsrZsxZsfnnfkd.bnl@flex--satyat.bounces.google.com>)
 id 1jxfM5-0006lj-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ORAQciKgJGVxLPMl88O8FRaS7Y2vfgBBYDIN8L834Cw=; b=IonWPsAf1FmJOu2FrjPbhAKHB
 soBHh/ZI8BzRfNz4ICkxXXg5rEXT9G7rUur9f1DkpUpG5cx0J+EbgR7nRBU32xvZa64Eb9kodOda4
 gX1gfZuGfE8NxKO5MRWLx73HhDkPU+pUI6zM6ur9ViXfWsOzHlpJELfZucs9rSyMp99ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ORAQciKgJGVxLPMl88O8FRaS7Y2vfgBBYDIN8L834Cw=; b=dBHycPRF1twzwrdWycdZNYBLVR
 ZPlPoZYJHfOFEk7BQO6gjOEFco41JDnZZiyKqNAvcHrPFMqQc6cAXY84Zf3kzrt2OuuRKDMfh0OE9
 G6AWwT5yR7a8oa4H6OYzIGylsUFN077WCkkOQH909YwLQZOCxSxFVjNMnsihxC8QP5NE=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxfM4-002EJW-B1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:57 +0000
Received: by mail-pf1-f201.google.com with SMTP id x62so13785160pfc.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 16:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ORAQciKgJGVxLPMl88O8FRaS7Y2vfgBBYDIN8L834Cw=;
 b=lw5TetxAIlCI7U6av5shkKyjO6ThYv7yDbySa3SgWcGSwSgPPaWjP++XkjFPG4OI6Z
 zWsLpvD626keD3tI0jFOivGvaW9+0l5eZ4l7hYSrpPYOPlwsi9MGB5ODpbI/7AA04Zb6
 tCC6woja7XRBkrAJHy6DcRwqP6vgX9nv2QZPhmI0hiNoTeqEbeuJdvn+TgYDZ0U60y3g
 wohrCT9NyZKibcZkl+RWiaSOHqiofv/sVgqViMF4tlhAtCQWBZ6HI7L1fDpq7bbcky5t
 iAtFFwrxXVO/FU54Nfq5i3XKHkcF5DMzbZKLz73/s51/PlZliyzBh0FjxR+L3S2QGwsQ
 HjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ORAQciKgJGVxLPMl88O8FRaS7Y2vfgBBYDIN8L834Cw=;
 b=D5UG7Xy4IFrzWhNBStsEsp0FYUJL2u+5Pw6UuirrPEGBzzXdtgUuq5TMAuyyItnb6e
 E60gXKBA8KyzxdGcLj4xt+bpFrBfQ/3gkpYzyo9Nj7b14esp3cdSDbBcSmbr8FAFlG03
 DdN7vaHy0aRcI2xIVpfA2jEAD6MtyI3rozZo9YYM3ltoyy57KjZLWEBJFSa858XVeWDT
 sp2BY0ISyjhNAk189eaDKriuKPUo1wK4PB4VF4aPKjn+LDanlObV6OvBXDsJ//519A9i
 bIafadem7Up00FKYrBJTiRIiH65EXFRpL4lQK9QvIQJRe+TrizjWyt9QKeLc0Rieywnb
 hIRQ==
X-Gm-Message-State: AOAM533DMBi24WXwTPRQsv6dhFRrbKBSOssXWYZNCuKVpFslwJbhWUct
 PskvshdM4AHWfEs7jYE1me81bLmeae0=
X-Google-Smtp-Source: ABdhPJzbpOkXCUZlTjezDtyNTQJ78cDjswr6o9ZRsmmCMJPX/pJ7vOwFhl9AcEfTreNpJVDB8ZhoYLeMtXM=
X-Received: by 2002:a17:90b:358e:: with SMTP id
 mm14mr1889035pjb.54.1595288270643; 
 Mon, 20 Jul 2020 16:37:50 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:37:37 +0000
In-Reply-To: <20200720233739.824943-1-satyat@google.com>
Message-Id: <20200720233739.824943-6-satyat@google.com>
Mime-Version: 1.0
References: <20200720233739.824943-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxfM4-002EJW-B1
Subject: [f2fs-dev] [PATCH v4 5/7] f2fs: support direct I/O with fscrypt
 using blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up f2fs with fscrypt direct I/O support. direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when I/O is aligned
to the filesystem block size (which is *not* necessarily the same as the
block device's block size).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/f2fs/f2fs.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..978130b5a195 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4082,7 +4082,11 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int rw = iov_iter_rw(iter);
 
-	if (f2fs_post_read_required(inode))
+	if (!fscrypt_dio_supported(iocb, iter))
+		return true;
+	if (fsverity_active(inode))
+		return true;
+	if (f2fs_compressed_file(inode))
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
