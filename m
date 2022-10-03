Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 988245F3306
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Oct 2022 17:59:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofNr6-0008FW-Ip;
	Mon, 03 Oct 2022 15:59:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ofNr5-000886-36
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Oct 2022 15:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LjD35+EgrmTPsU4Ykx2Ec7FHUSe93L0NcK+pYBE9B4E=; b=cJhoZcV2YWkzR493HzgRmoF/79
 sd8QCuLN4yqk5euWfiZN/3E8pSHtYw9tmjoxaD5ttE0RPTymXhkDqh1rC19JpdysTZcKwEcROCgIB
 yQcNVuGisAnF56gI1+bs15/37z7p8kyLt0C/23r2THylhXihQD43ufyVlAeYx6tH8474=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LjD35+EgrmTPsU4Ykx2Ec7FHUSe93L0NcK+pYBE9B4E=; b=eSS7c4MCXySZEaAj6o7nkiLt20
 /RJL8q9hVDFLhSfgN9A9p8azjgf3UkY2cmrWKtTg141jVonzPMw1GByOHjymimJAqsLyRpk+YJTDF
 V+yxkseMEgSCekm8Dk++Em08WSYHrjLAWFhr+AM2ihXsmQqN7Wiv/T6kUulxUG8Apbho=;
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ofNr1-0007Os-Jq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Oct 2022 15:59:42 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-3560e81aa1dso88044887b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Oct 2022 08:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LjD35+EgrmTPsU4Ykx2Ec7FHUSe93L0NcK+pYBE9B4E=;
 b=dI3aqOLQ49oGruKOrzcF09CLHI/WTgFI8KqF0hZ51qkOOpP0N1nyYjBZKBBHgHaeT/
 qLC3oTnctjQFlStJ8Jw2xHE7Hpp1Recl2HHAauakTt7U247aFZeGMxk9sZvYyaoMrFhL
 9Uid9pAu0w+ki4+Wg6qGM5raanW1hEdrZRHFOiO0euT77WEacS5lm8XpEBjrIa576hud
 N9qjtGNAsJq22kA8N29CEHOJysb95L4PeZPAa6sZAWL7308spwSsj+4mFk2GyCQwpjWB
 gxcmUWXziwMmq356d4SIe/uQFSk71ViGSQYZYBjIvvEnCMLC156S+oMHueWunLsGnE8l
 TprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LjD35+EgrmTPsU4Ykx2Ec7FHUSe93L0NcK+pYBE9B4E=;
 b=2Iut2Y3v3HGbild68qWHM3Vhrq5NT5l2+g22T0piXZmDHzqsqNjLML71bDp6J9HvwP
 39PzaLRrCuKGSqp0GbVsCRQhnQRwz+AgO3Y3AXYccAOrf0WAdPicGG/xNRiQrzoIufy5
 14XkGxLN2wZdQTqOb2hS/eQVeRTjJYOYxBd10szeSFb/G09SgNb/nzps+Kp0493kwxC3
 TMMWYHP3pU34s9ygn52JAw5YrwUZ3/+l1LDp9IIWw04e7YQRVUa2e0wJ9dUY0l4nIsDt
 Z5T6br1+BnksmCjai4laJqEL+zdvijvx4t0tlREsRN+jM096MvET3LEUsQD77JiG+O/r
 wWGg==
X-Gm-Message-State: ACrzQf15cZQRuGPtX540gCSp36ihePnpO27Gn6xter1NawSrap6Q+JKy
 FFCV1LFYRC+3xLCSBeNFxGgP/MTQM6w6OW9me9E=
X-Google-Smtp-Source: AMsMyM7GNFiVuGANFp31gl/LOulqhZo7CEVH8fjJPKg8mpgcsq2EBbqcwABNf6O7PcHHMESuhTX/UShVrW4W8vQH4vk=
X-Received: by 2002:a81:6944:0:b0:358:afb5:5d92 with SMTP id
 e65-20020a816944000000b00358afb55d92mr8054927ywc.173.1664812773809; Mon, 03
 Oct 2022 08:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220920014036.2295853-1-daeho43@gmail.com>
 <f4ce9486-f104-b0e2-25ed-f6de96316b76@kernel.org>
 <CACOAw_z=9H6jEQNd8C99c6xO55PJXWJOW7Q=78qtppgysebN2A@mail.gmail.com>
 <4aca0d00-d3b7-975f-6b72-ccd6f07d22e5@kernel.org>
 <CACOAw_wVU1gmH1gyWHYNqCpgy4KGKB+EZK6pbGL-h_1ToDV=vg@mail.gmail.com>
 <53df1b78-c611-6a22-88b1-74cc83a9e148@kernel.org>
 <CACOAw_w_09sz8PxnSGzNmJwh1-y_3JoKbBu80VjgZgV1uxo7KA@mail.gmail.com>
 <CACOAw_wjcFr1fg3QRYPUyOGyo-G9D9U6=qprkPUP8PzoxPQkMQ@mail.gmail.com>
 <d3992e1c-3251-f900-97be-049b1e1e4e37@kernel.org>
In-Reply-To: <d3992e1c-3251-f900-97be-049b1e1e4e37@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 3 Oct 2022 08:59:23 -0700
Message-ID: <CACOAw_xCdjT8CzVNV1LHZ3bGZvyWG+Q0=Vz2eX2B0Pt9GA=ewA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > What I mean is: > > --- > fs/f2fs/file.c | 4 +++- > 1 file
 changed, 3 insertions(+),
 1 deletion(-) > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 > index e4b6e51086a3..31b229678b1d 100644 > --- a/ [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.176 listed in wl.mailspike.net]
X-Headers-End: 1ofNr1-0007Os-Jq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> What I mean is:
>
> ---
>   fs/f2fs/file.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e4b6e51086a3..31b229678b1d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2053,6 +2053,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>
>         isize = i_size_read(inode);
>         fi->original_i_size = isize;
> +
> +       set_inode_flag(inode, FI_ATOMIC_FILE);
> +
>         if (truncate) {
>                 set_inode_flag(inode, FI_ATOMIC_REPLACE);
>                 truncate_inode_pages_final(inode->i_mapping);
> @@ -2063,7 +2066,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>
>         stat_inc_atomic_inode(inode);
>
> -       set_inode_flag(inode, FI_ATOMIC_FILE);
>         set_inode_flag(fi->cow_inode, FI_COW_FILE);
>         clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>         f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> --
>
>
> Let's set FI_ATOMIC_FILE flag before f2fs_i_size_write(inode, 0), so
> - f2fs_ioc_start_atomic_write
>   - f2fs_i_size_write(, 0)
>    - f2fs_mark_inode_dirty_sync
>     check f2fs_is_atomic_file() and return correctly.
>

Ah, I got it.

> And for the case the inode is dirty before f2fs_i_size_write(, 0), we
> can call f2fs_write_inode() to flush dirty feilds into inode page, and
> make inode clean.
>

Thanks for the tips~

> >
> >>
> >> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
