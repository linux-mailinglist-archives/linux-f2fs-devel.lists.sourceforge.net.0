Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D017B3E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Mar 2020 02:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dza82isaYh2hWbZMbuzknhNoaKHGqkaW68KjrtTu9EM=; b=cKXtUKJAqwM+lUsIU9niesB9kt
	7PfEPNOjqD9ncRY91HwAa5pNqE5011BmbJxA9iZjbWHQsGb4g8Fv7GZXICk0R7E6iPs9ggQHkpkRR
	RQMTwGXtKkEuLdcEYMvjXX0A3vq/tJcv0b6T9VaGPThkn/7PITR3Go+VtRKt2zmhKCgg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jA20V-0008VC-D1; Fri, 06 Mar 2020 01:42:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1jA20T-0008Uw-S9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SO8SF0fRs4gm9zjgJ5npIDJ8ex1hHPJ1UNzxdktCWGU=; b=F1Bx4g28kMEJcISzOv3QmjF2lP
 B41szmHssEj/DraCi6aKoXtDQ+T3IM88J3n6fblCSXzPJQm8Rix42W2v/DLeSvyEB3iqcusmo28p6
 H7fhOOIzHNrOrt1JVjdiJRvqaYX3YpJs29qD9XgP2rTBreCLEJIZeYCd6j62J0QEJ/hA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SO8SF0fRs4gm9zjgJ5npIDJ8ex1hHPJ1UNzxdktCWGU=; b=L3JR7u0aqI+rdQBaiKb+vQ1ar8
 Eg3UeWvlu5wrNmNVeWQ3jMN9qNU46Smmt3qxbmTi+UsX2othAknY3QCd7xnx95nSfvaUcYcCQi2d5
 THiJjpenigrYjcg6EQnKYjFVZFOYFtanFm289QEePP8JOgctoNf25Q4skCWanu+1EcJU=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jA20S-003czq-HE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:42:29 +0000
Received: by mail-lj1-f194.google.com with SMTP id 195so483303ljf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Mar 2020 17:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SO8SF0fRs4gm9zjgJ5npIDJ8ex1hHPJ1UNzxdktCWGU=;
 b=c1Lcx9ELcG0+k4Gd2AIRBYtY97tISFMaQp+9h1vDWLH6UoUJdJVvRhM0Fgp9B/8M7S
 PtTrzdPy44SWe6ROZIUTTrUxAzx694ibOZI6peNisdwdQJjVE20d09XZXTutZNkPX8nq
 i6QBe0/sN7nTyD6PhtFlo1XTgFSI6J0Us3GRPAu9HC+rcfjVbdOqQPDsqg48Oa1AkwxJ
 VfZv/EavO1Pqtfks3zXKvFxYEXZBk4Pedp4cks+Gm9xqlmB/TbLbLMH6wmPf8vs8SMhA
 AUNQaGF04ysOAnF8y9II99At1Mo8v8Qpara6YzgpxdmjDNdyEdQoVyDewS59z21y7Psy
 w8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SO8SF0fRs4gm9zjgJ5npIDJ8ex1hHPJ1UNzxdktCWGU=;
 b=Po5X7l1ZFS4La9jftanr7ttCn13tkAT4Pw3yiS9FALZTNciO2l4I7wqQtRHdDSXLFK
 Es0Rc1IWISfmPJyBqtqT4KwI4PoFBO9UNfmh8IHcXLhIlnhJpd7TZ5z6BjcP5EdSSAew
 oNvCaTC0Hm7JWWVpj0a/vI4M8Rn2X4xgmEQEQqE4wKeLs9SBYHxNwenCihKCnUWNRfbA
 InKrujR+Q4BHE9am9bh25Pjppoe3dtUvvV3m7yw/Mt5qe6F9Dx9hIkW+YrDKfIfQpkJn
 3tlh2j124RfMhJzGSl1FedS+69EQBMFFxQtPHEg77PI33D3pVYKN31tJ4ZJJ7R3ERPCc
 L9ig==
X-Gm-Message-State: ANhLgQ0vHm3meoBSDCgxNhZMonvIWnUx6Z+zhkwzlUbg0gEVIVUZ0uSq
 IvSvoY/zDcW+rt/oO2DPpzcYbCH07IxofJt3Y/3BEA==
X-Google-Smtp-Source: ADFU+vsUzFDdnUIJRLlqBuiFTmXiQyPhd5qDYK/Hba2PjE1nOCdXigvTmsJiIGoQj37+lpc+JgCwMfHz60VPmy3mmOk=
X-Received: by 2002:a2e:9918:: with SMTP id v24mr525320lji.197.1583458941188; 
 Thu, 05 Mar 2020 17:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20200305234822.178708-1-jaegeuk@kernel.org>
In-Reply-To: <20200305234822.178708-1-jaegeuk@kernel.org>
Date: Thu, 5 Mar 2020 17:42:09 -0800
Message-ID: <CA+PiJmQzj0Lj2FKi3A4Z=LC_tcQ9i9xtb3dmXwa9fSsQ+YN_LA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -17.1 (-----------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -1.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jA20S-003czq-HE
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong check on F2FS_IOC_FSSETXATTR
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 5, 2020 at 3:48 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> This fixes the incorrect failure when enabling project quota on casefold-enabled
> file.
>
> Cc: Daniel Rosenberg <drosen@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---

This fixes the issue I was seeing, I'm just a bit concerned with the last two.

>
>         fi->i_flags = iflags | (fi->i_flags & ~mask);
> -       f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
> -                                       (fi->i_flags & F2FS_NOCOMP_FL));
> +       f2fs_bug_on(F2FS_I_SB(inode), (masked_flags & F2FS_COMPR_FL) &&
> +                                       (masked_flags & F2FS_NOCOMP_FL));
>
> -       if (fi->i_flags & F2FS_PROJINHERIT_FL)
> +       if (masked_flags & F2FS_PROJINHERIT_FL)
>                 set_inode_flag(inode, FI_PROJ_INHERIT);
>         else
>                 clear_inode_flag(inode, FI_PROJ_INHERIT);
> --
> 2.25.1.481.gfbce0eb801-goog
>

Shouldn't these still be fi->i_flags? masked_flags comes from the
previously set i_flags, so this would change from testing the new
combination that was just set for fi->i_flags to checking only the
masked version of the old flags.
It might make it clearer to rename masked_flags to masked_old_flags,
or something like that.
-Daniel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
