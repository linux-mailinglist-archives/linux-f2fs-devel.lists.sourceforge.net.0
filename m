Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36F9D8BC0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2024 18:56:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tFdK4-00071T-4P;
	Mon, 25 Nov 2024 17:56:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leocstone@gmail.com>) id 1tFdJx-00070h-Dt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 17:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cwOT6QQSrwG/cTZ2ti35IJ9oZT7dv9UB5scn5A3d/XU=; b=gEbI82HmcJiaIQW/dFRtFsFtvb
 3yjAHytWhYmRAY+aNKqVDJdJX4NjS3M2x+Z8DZ83CTZFFwc3UGDxv/aiAb4OpgiP+cryBdMpdke7d
 xF69CD2FzsfRL6s+bFU3DH5vgSf9W0fXjE1JAK2+BThlTQ+k6QV9UMlP19QUstcJTB5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cwOT6QQSrwG/cTZ2ti35IJ9oZT7dv9UB5scn5A3d/XU=; b=jX89yt29olrcYjY1gI1kr2ULuk
 MJZq8ILVWCIspUx3rXU4gQMRIiI5nZNaevwRyPlL7Wmmj/rhfePHpzLZbe9xPaZ2kkWWnWyvAVIKB
 ATBJ/xjFtfjbXMscieOr21pJyk67P2/s5Uy/2vpgmRES1xRDEJ87jRJmzy6QBYxDRL0g=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tFdJw-0004LT-Ro for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 17:56:25 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-212348d391cso46317415ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2024 09:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732557374; x=1733162174; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cwOT6QQSrwG/cTZ2ti35IJ9oZT7dv9UB5scn5A3d/XU=;
 b=B9qPm0WNuJzbEvpa9V8Kxi8dkSmsUNcMKxPiy60BEr9qGcSO5LqDf1ecYBt9itshGR
 1tAuFnIyV4P1TPz5r4mC8vaC4THarMazYoKeBxGX5REQkZwADRjtdrmc0zSh3OHRzyNC
 tIXytjx1/ShywbG6alpnmXyuFbrQIOb2cS/pJh4CW0YuVLanNqESjdcIrrT8qpdTiVaC
 Z0U+vN7HQQcbBNtPS2RuMsD5SZYMtsBgdDqc235MuDI1V/gD0MxaKvBJAkMTUYuFQ5SH
 5UPSMYuUKSEFqIPTPfNei8h/B44rGjsVVrV61LGFJp0gTVEDy1uofFEQQY5g8TsFc3CC
 rYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732557374; x=1733162174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwOT6QQSrwG/cTZ2ti35IJ9oZT7dv9UB5scn5A3d/XU=;
 b=CXDnuZ5cR9CgGa3/3XD5ADvXRUsk07/WiN5fErSkVl66CzQjD90uB0SsUR8Af9njrj
 cJ44POlYdcVhii+gPvy7VvMc886r/APJiCLlo9HL18F0MM6jSDydJjn1ygO41+oN/1/q
 tYpE/4waMSkqU/5smcca+XtvWf5Red7VEM9P8i5tJsqE+Zyd4hvkb67G2rmq461IOAP7
 WX7TU+OXC+iMDUI5mR98oCTFx11Q6KV5hztEHwzy5N1Prw0GvMmJQqbuQvanz/OpDgZG
 ZhrDl3bmSUPcTGPGwQMP5+538dYdFI4+KXT3+g6t1DZbr/ryxoG2hmPQkQ9RtNhwJML3
 /Qvg==
X-Gm-Message-State: AOJu0YxjPukQ/24IsQ7STKhO+kiMoYeydtABw+Y1Cu0IQqFZ3mDSbJ7f
 R+KW52JlyMhnR5QcCauFdqM/vinWoBgA213HDlhbbpjZzg9AHRUdNhRmlOVKtyQ=
X-Gm-Gg: ASbGncua977hYYiBjrbCAVKz/pkJpl88y308Caq4706z8g7ToGXlSvmmuT2qyrIIBsw
 Jz3hdcv6Ku85XVdK7c5i0xztrqgHprserFcMjRZOdJpf609tMjd58Y9pQ4sNd1JUXHM5Lhc4ey/
 hcq4WjwqRPvbrcjGgs3vdDWWoL2YtBGaeaUDkswtRczhQy1f2AhF2ZtPOs+LFMb7KiDqM624pa4
 EdOZube7u8bTJHgCkf4zPbI33VfwHelU9dyuw==
X-Google-Smtp-Source: AGHT+IEZ+nafAqL1hXYBb0A9DUlays7oUMLPAEGJkcpQ3NA6AAy1BuUS+Aqzzg7+AZcRdswtRLnhcQ==
X-Received: by 2002:a17:902:cec7:b0:20c:a175:b720 with SMTP id
 d9443c01a7336-2129f65a8d7mr212913395ad.1.1732557374096; 
 Mon, 25 Nov 2024 09:56:14 -0800 (PST)
Received: from tc ([2601:1c2:c104:170:2d2:ed5d:17c9:e364])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc17554sm66434065ad.208.2024.11.25.09.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 09:56:13 -0800 (PST)
Date: Mon, 25 Nov 2024 09:56:11 -0800
From: Leo Stone <leocstone@gmail.com>
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
Message-ID: <icjuhtz35zvp5j6zvgbubydbmirbsr4ceasgxr3rk333bj55dp@mp5yf532hd4i>
References: <20241124010459.23283-1-leocstone@gmail.com>
 <1652260c-7657-4f40-ac79-027666f512f0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1652260c-7657-4f40-ac79-027666f512f0@kernel.org>
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 25, 2024 at 07:16:41PM +0800, Chao Yu wrote: >
 > I'm fine w/ this change, but I didn't get it, how did above commit introduce
 > this bug? Hello Chao, The commit from the bisect didn't exactly introduce
 this bug, since it would still be possible to make a different image that
 does the exact same thing in the older code. 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [leocstone[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
X-Headers-End: 1tFdJw-0004LT-Ro
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add check for deleted inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 25, 2024 at 07:16:41PM +0800, Chao Yu wrote:
> 
> I'm fine w/ this change, but I didn't get it, how did above commit introduce
> this bug?

Hello Chao,

The commit from the bisect didn't exactly introduce this bug, since it
would still be possible to make a different image that does the exact
same thing in the older code.

This commit was blamed in the bisect because it changes the layout of
struct f2fs_inode:

> @@ -271,6 +272,10 @@ struct f2fs_inode {
> 			__le32 i_inode_checksum;/* inode meta checksum */
> 			__le64 i_crtime;	/* creation time */
> 			__le32 i_crtime_nsec;	/* creation time in nano scale */
>+			__le64 i_compr_blocks;	/* # of compressed blocks */
>+			__u8 i_compress_algorithm;	/* compress algorithm */
>+			__u8 i_log_cluster_size;	/* log of cluster size */
>+			__le16 i_padding;		/* padding */
> 			__le32 i_extra_end[0];	/* for attribute size calculation */
> 		} __packed;
> 		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */

This changes F2FS_TOTAL_EXTRA_ATTR_SIZE, which allows the syzbot
reproducer's inode to pass the sanity check for corrupted i_extra_size.
Before this change, the inode gets rejected as corrupt:

>[   62.794566][ T9662] F2FS-fs (loop0): sanity_check_inode: inode (ino=7) has corrupted i_extra_isize: 36, max: 24

Thanks,
Leo


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
