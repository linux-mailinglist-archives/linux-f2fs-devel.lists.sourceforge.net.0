Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0452CBC3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 08:09:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrZLl-0004vr-AL; Thu, 19 May 2022 06:09:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1nrZLj-0004vl-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 06:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PNDXrv+ygiGRP7Ew+ogCVIR6dtT/3oMpUNbrS/sX8rY=; b=BKOkKTp0DWBq1/Yz+M5tbDT0ig
 OwYamTS5BGzLlTe2JZcRzk7oW6Z6Gv6SZqN6lUWhfYcC/4QdjmuCO9Bjiz7oHbP9X09BGkSPsvFU7
 F2ErBdwhiVhIR3PRylmb9s5kog3IA6RUrdJDIcvkAvUo7aTcbtd2YvTVCAOry3v2fe08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PNDXrv+ygiGRP7Ew+ogCVIR6dtT/3oMpUNbrS/sX8rY=; b=SZf6BlbST8N3AynqhUr+QBreT3
 1RN4AiR4Z44RM0l7UP/oLm098YYkyoUWZjug4i1Po8wYkfWdQ/WPyLYPk1I83TJXox/31erln5/10
 hH5glRkKFzo/f83cgKVi78OeGSfO5o98T8hz3V67VL6E+NFKRMy193pCEV0hhFAY6C3g=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nrZLh-008NOB-Ko
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 06:09:26 +0000
Received: by mail-lj1-f174.google.com with SMTP id l19so4992828ljb.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 May 2022 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PNDXrv+ygiGRP7Ew+ogCVIR6dtT/3oMpUNbrS/sX8rY=;
 b=JraGpmG0cqUHEyLAfLVhlpM+dTRiEpUtcsF0rqAjnl/+B59Y9yXJff5hLwRoGkgk2O
 u72zMcTB48oO881CVG7a9/iVM6gTiRqxMW8zSp/jYsjniUTfyl5utHeSoPkgeFEeQO3j
 cA6EdnCYdvzttofR8wbD6CHz6CDBp6FhqCBBLyUQTg1SV7w0YZvLo3eMR1RZosUFO1ez
 8iH/WaeMwUSQeKHqCyGGsWhY3M/8VhwtwJwXk8y/UGsehKGk4eMffFH3aXiKrNW27wFI
 ld/fW3048PVpXv45bNZK5u27I6G3mDoNlycNroowpREKpCQB5/lu4aZrCpO61LTzwjlh
 /X3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PNDXrv+ygiGRP7Ew+ogCVIR6dtT/3oMpUNbrS/sX8rY=;
 b=G9iY8SudSRv9ScgDoq8zqtHqDuWCGq4vzOTqPqft69jYIM5RpMu6GZJgtbHXAfhJdQ
 aKbqY6L6E+MBNjivKZNIO7i8O3js0jDCox06Rtb4RGRo7Lbsq8GFh4Lt/gkXo/o6s9S6
 w4V0if1ilDh0WsOoVmJ6izAYXn9YMdPFSToVwgFBjIGg/3ifA+F+IYvOv5s0dnZctR5K
 mPC3CQgLBh1lCKSzgQArO+GkcEIEQsSaFKcq1iri+4srAWVmixAgnrBhVP/GctLzAydl
 T9uHSmdpcfh7k3BP4JZll3sSCqw4Cs9Z4tbCplg1eOi5c0jFM81v5V5s9cku7wP1AP9+
 LaXQ==
X-Gm-Message-State: AOAM531DUV1F3jXF4fTY/P58FmFcd2ZWdDGkcgyeTLq21d60ty7Cb9Tg
 IZP7ynN3+uLf7NXf4gaaqbFvLwe/mvwY/QfDvolOWv95W2nqXSoBvj8=
X-Google-Smtp-Source: ABdhPJz2CZJFdxXN0qnPt5mP007Oh9MW3+s8BmVyfAOyENDI/3SMbwSwAPrScF2SF7YTdQ+xcMrnZhyu9OlPiQQHjKI=
X-Received: by 2002:a2e:8210:0:b0:250:87c9:fb69 with SMTP id
 w16-20020a2e8210000000b0025087c9fb69mr1723105ljg.470.1652940557605; Wed, 18
 May 2022 23:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220518023123.2455827-1-liuchao@coolpad.com>
 <7d1878ef-e1ae-0550-7d6d-2a2ff858586c@kernel.org>
In-Reply-To: <7d1878ef-e1ae-0550-7d6d-2a2ff858586c@kernel.org>
From: Chao Liu <chaoliu719@gmail.com>
Date: Thu, 19 May 2022 14:09:06 +0800
Message-ID: <CAKaaq-WTHtxF28h_5uJD2y0SGz9q2greBtTaGLhCpBhfsA3xtw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18,
 2022 at 11:23 PM Chao Yu wrote: > > On 2022/5/18
 10:33, Chao Liu wrote: > > In f2fs_read_inline_data(), it is confused with
 checking of > > inline_data flag, as we checked it before [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.174 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nrZLh-008NOB-Ko
Subject: Re: [f2fs-dev] [PATCH] f2fs: make f2fs_read_inline_data() more
 readable
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
Cc: linux-kernel@vger.kernel.org, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 11:23 PM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/5/18 10:33, Chao Liu wrote:
> > In f2fs_read_inline_data(), it is confused with checking of
> > inline_data flag, as we checked it before calling. So this
> > patch add some comments for f2fs_has_inline_data().
> >
> > Signed-off-by: Chao Liu
>
> It looks email address is missing, but it shows after I can apply this
> patch to my local git repo...
>
> Could you please check your email client configuration?

Oh, sorry, this may be caused by my SMTP server, I will try to
resend it later via this email address.

>
> Thanks,
>
> > ---
> > fs/f2fs/f2fs.h | 4 ++++
> > 1 file changed, 4 insertions(+)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index f579e2ed0f14..5071f6636e41 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3167,6 +3167,10 @@ static inline int inline_xattr_size(struct inode *inode)
> > return 0;
> > }
> >
> > +/*
> > + * Notice: check inline_data flag without inode page lock is unsafe.
> > + * It could change at any time by f2fs_convert_inline_page().
> > + */
> > static inline int f2fs_has_inline_data(struct inode *inode)
> > {
> > return is_inode_flag_set(inode, FI_INLINE_DATA);
> > --
> > 2.25.1
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
