Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 809058159EF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Dec 2023 15:52:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEW1b-0006HZ-I1;
	Sat, 16 Dec 2023 14:52:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1rEW1Z-0006HT-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Dec 2023 14:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oA7sme/wc8753vvLvAf7lyhPDObfPHeWsrUyMBHufRA=; b=hQvtNn7VotElmW7Xg94e2frelb
 /gBNyznI0JEEtWEhGC/2gxX6OnNU7m0hkJjQ/IznByKKQkzrLXvxvelBZKJcpRAIelEDL06cLRnQM
 kQ9qUMP8hxcvUI+YY5vsAYqmsI3ZujGAxDqqYLPw+E6e3tUxnST5tWxzSULv7Kw0CQ8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oA7sme/wc8753vvLvAf7lyhPDObfPHeWsrUyMBHufRA=; b=nBBrsasmFBJ1zutd8xDgHQorkO
 egjd9w8SaP/BmzZQ05+xvcABlbq9Dp67aXgtmIn7RzdKT6nIWVrVBHPz6UkuPt1z/Outkbe8HbCaa
 gUXJgIa2U+YA5tyPnCOaNt8cF1PnnfDu3JwjcW8jbAzpcjsx6+5gEYpmj4xo2Pm4UUf4=;
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEW1U-0005Zl-OM for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Dec 2023 14:52:18 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5d226f51f71so14499347b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Dec 2023 06:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1702738327; x=1703343127;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oA7sme/wc8753vvLvAf7lyhPDObfPHeWsrUyMBHufRA=;
 b=lf2y+NgLnR7jWLa52iJDCEw4prjBKk0uRXdiEVwXADmQPkyjj8I6mIXu5lbyS1BCXi
 1yCZyXdg/EulvxpOvZqOZUuuxLiokvIycWrN6AI7Y5NwTP6rKz3IdFNktGLc/2qlqdkh
 YgSyQrot+m364hAT48in5sQwwhf6X/LCnNY07eUDcsbLOZ1D5hVVxbffZ+Lr03M0U98c
 RBGa09PJ3G90ZAbsmBGiLIVBqY9SJ5FV2hcfwirmX+F5tnVfsQGVKTan0Nw5h81lvLQC
 1LxRk1SSR5zXUEsAQnscXNQnx1FkhN3PoaH4qT8/GDOBYA5l2JOrhaY6Kp1YLpbhTbNA
 FN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702738327; x=1703343127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oA7sme/wc8753vvLvAf7lyhPDObfPHeWsrUyMBHufRA=;
 b=iZeU75VMqMhDiYk1sHBeoFfBO/fUGMwENV8R6lVNFfAYTJ5B0GXhvXkGMlNlcJY/Mz
 hGGpW7hGzPAh4n3PpcUnEfMw6UFN5ftP981I+Vlx84Z04J/MvOfSNsklMoBT3Vz5bpc8
 3hP8u2S5RAyW5orR+cGbHvbh5IW7aVK/3yULQBgVHNDH6W/SR5flEvjnk7xQkwJsLszx
 KnDBKxBSj5GFXYQUXMp3UxrT+Yy/GKNjbo3GC7A7xl0Nr+s891iulONIY1S2rK2gs9tP
 kaY48UGOE3Qv4sXHBQkWXTJ5XfMIWt6Ej42FwpWZ3UmOy38TEBl+ixgzETVmmvCu9pQt
 +/ig==
X-Gm-Message-State: AOJu0Yw2uATZF360TO1blkr2Ot9acGMM+Ku9IFc2uiL+9p6TIsi/KdsK
 TVqQpjKtbFy1fc+4pTfgGXYPvw==
X-Google-Smtp-Source: AGHT+IHWGNP6VHnf5q0ZRFEjeJKxW9r1newfiPTngMIN/hqAeqSoGGRlOnrewaj3tKDeCu4fOTF1QA==
X-Received: by 2002:a81:df01:0:b0:5d7:1940:dd62 with SMTP id
 c1-20020a81df01000000b005d71940dd62mr12001424ywn.56.1702738327012; 
 Sat, 16 Dec 2023 06:52:07 -0800 (PST)
Received: from localhost (076-182-020-124.res.spectrum.com. [76.182.20.124])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a81920e000000b005d951c0084esm2134721ywg.21.2023.12.16.06.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 06:52:06 -0800 (PST)
Date: Sat, 16 Dec 2023 09:52:05 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20231216145205.GA1023996@perftesting>
References: <20231213040018.73803-1-ebiggers@kernel.org>
 <20231213040018.73803-2-ebiggers@kernel.org>
 <20231213084123.GA6184@lst.de>
 <20231215214550.GB883762@perftesting>
 <20231216041221.GA8850@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231216041221.GA8850@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Dec 16, 2023 at 05:12:21AM +0100, Christoph Hellwig
 wrote: > On Fri, Dec 15, 2023 at 04:45:50PM -0500, Josef Bacik wrote: > >
 I ran it through, you broke a test that isn't upstream yet to test [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.175 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEW1U-0005Zl-OM
Subject: Re: [f2fs-dev] [PATCH 1/3] btrfs: call btrfs_close_devices from
 ->kill_sb
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
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Dec 16, 2023 at 05:12:21AM +0100, Christoph Hellwig wrote:
> On Fri, Dec 15, 2023 at 04:45:50PM -0500, Josef Bacik wrote:
> > I ran it through, you broke a test that isn't upstream yet to test the old mount
> > api double mount thing that I have a test for
> > 
> > https://github.com/btrfs/fstests/commit/2796723e77adb0f9da1059acf13fc402467f7ac4
> > 
> > In this case we end up leaking a reference on the fs_devices.  If you add this
> > fixup to "btrfs: call btrfs_close_devices from ->kill_sb" it fixes that failure.
> > I'm re-running with that fixup applied, but I assume the rest is fine.  Thanks,
> 
> Is "this fixup" referring to a patch that was supposed to be attached
> but is't? :)

Sorry, vacation brain, here you go.

Josef

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f93fe2e5e378..2dfa2274b193 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1950,10 +1950,20 @@ static int btrfs_get_tree_super(struct fs_context *fc)
  */
 static struct vfsmount *btrfs_reconfigure_for_mount(struct fs_context *fc)
 {
+	struct btrfs_fs_info *fs_info = fc->s_fs_info;
 	struct vfsmount *mnt;
 	int ret;
 	const bool ro2rw = !(fc->sb_flags & SB_RDONLY);
 
+	/*
+	 * We got a reference to our fs_devices, so we need to close it here to
+	 * make sure we don't leak our reference on the fs_devices.
+	 */
+	if (fs_info->fs_devices) {
+		btrfs_close_devices(fs_info->fs_devices);
+		fs_info->fs_devices = NULL;
+	}
+
 	/*
 	 * We got an EBUSY because our SB_RDONLY flag didn't match the existing
 	 * super block, so invert our setting here and retry the mount so we


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
