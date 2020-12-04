Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F002CE703
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 05:31:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl2kf-0005pg-WB; Fri, 04 Dec 2020 04:31:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kl2ke-0005pV-L9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ktrYpX+PX9gYP19cphCNlBkQ//YDNX4xO30NBDFiHic=; b=EAq2pSYEqiKOEaoC/G82lzOn/S
 MPHFbfuK4KkL9qUTDkJklxwIeGOsgCiLw0/Pf6TVDjuVuV7jTmcfZUdOF/mSaCIEHCN0+RjQiM3lM
 l6ZVqI/JfULRkYaRCOeXRJtOUZno1v3JJK1mKtrKlwoQp+NUy2iOzm+gZaBEo6y8aJX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ktrYpX+PX9gYP19cphCNlBkQ//YDNX4xO30NBDFiHic=; b=MUbYYEYf4Os+Xt2lB2TqBOpzT2
 aTM7ggnPux53tWEUrM8HMfLwiw8G94w4a4wlOfFg7UWrVNjJDuZPdkGNKuQAWiax+glZ0Z5dVslGZ
 o9NHnVsQUvxc9V1aXfeoj94sz2/Vhnw5h/T+h8zom+y3Gnh/dCqgZaSGkt5VNuW6chiw=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kl2ka-00141L-LH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:31:24 +0000
Received: by mail-lj1-f193.google.com with SMTP id y10so5092805ljc.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 20:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktrYpX+PX9gYP19cphCNlBkQ//YDNX4xO30NBDFiHic=;
 b=G+K4k+QRVIcqBpiniR98E2i04SzytSueXbyUbePP/tzHYCXScQCtfOpD3FDqFJIiNa
 PaoWl/uOeCcNnk0pzfJvb3Gp9mILali+q4Od8QR+b4sPnbNOfFY03zgZWy8UN04Ll8Gs
 7kAoYZcrP7ADjMszw1JNB8nmnPbO7MXNqXanNDVaN3QGHseaeVPnPu0d8070o3xxLA0B
 Ekf8dIiwINEAir7R6QWCPpPvI19pXTfaCOLC1OmUWASv6vUBTBZ6JoitLkgObFdHYx5u
 NHeNrOm/d9nyXA3+CY2Q4cw/AG4FaDj0Cwt8kT2wt79a+Dd/ZQZFSqlgTzWMEVZTn1Nm
 7Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktrYpX+PX9gYP19cphCNlBkQ//YDNX4xO30NBDFiHic=;
 b=c0v52bDOkbzGPbiGMfwF7mJD6ISeXXpLucTXjXTi9lsofgN02REZAxZfh7L1bHoYjZ
 82GSi7jTFW96hcwCSYzVlZMrl/1d7BfXk/jwcFGGnTxOG9lr+dqNGzvKcbuKe0LCLfph
 S7q93oGCKBeB+6kfbIGLGgbw5r21SIuQtO5VosvXx8BUWpDDKTLTQ2GbZwD5eN3WidxQ
 6gBKzAKN64kfS2t+FsjtnnFn2nWclGApunbBuNAmPujEZWdJchNFeaJraVpqm2VaiVra
 wfnT6GR9R6/4PgcElA4W0GKR1nWsFBIEXd5or8biM4e5rIPhKJ9xmHrWm5NrAikqhV09
 R07Q==
X-Gm-Message-State: AOAM530MFMcsCZpiI0aMVLHGkYJVDA+jujD8WIec7Z9OgL0ecZhgdR4z
 HtIZERhX00RusnqE9EmpsPLwFS5ie7WaI+CO49Q=
X-Google-Smtp-Source: ABdhPJw0FeImudjdeH5qfoDpOQfWxMjQ4PsUd97gtFUlbztvcwa8aphO0i7QnrxdlIge7kWnZlhCFnApVq4xoHTNbw8=
X-Received: by 2002:a2e:9654:: with SMTP id z20mr2505992ljh.335.1607056273762; 
 Thu, 03 Dec 2020 20:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
 <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
 <X8m0qbd7rvQyiwOt@sol.localdomain>
In-Reply-To: <X8m0qbd7rvQyiwOt@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 4 Dec 2020 13:31:02 +0900
Message-ID: <CACOAw_y2HRE8CDk-HAjA6w_HzGJpRpivPY5zKRMC4_SNYTnTGg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kl2ka-00141L-LH
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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

> Are you sure?  I thought that compression (and encryption) apply to the whole
> file, including any Merkle tree blocks past i_size.

This "dic" structure is only for "de"compression, so we don't need to
worry about going beyond i_size case.

> Also, even if you include the i_size check, it's still wrong to check
> fsverity_active() in the middle of the I/O because FS_IOC_ENABLE_VERITY can
> execute concurrently, causing fsverity_active() to return false at the beginning
> of the I/O and true later in the I/O.  It needs to be checked only once, at the
> beginning...

Got it. Our previous implementation didn't consider this case. Need to fix this.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
