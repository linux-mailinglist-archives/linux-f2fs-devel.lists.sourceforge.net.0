Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 410162265B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 May 2019 11:19:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSHym-0006yu-A0; Sun, 19 May 2019 09:19:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hSHyk-0006yh-JA
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 09:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ivJjsfdmts+KncdY5o9huQPOa6BOQoOViFQQq1waUt0=; b=a+ckpiSMJPcZMOPqt2OzgcouBb
 ZlsIjIejWKZdMrhGDrnwdzIqszwmCU5k4v/5uDwMLIDxcSTQs//Qv+tJDdhAbXAWvDT430wO/iaQA
 A8nr/3ct264UeIx8SJE3BjPEybnZORoUvog/ky15Jl++BujxQRTirq461sQT73Agx7wU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ivJjsfdmts+KncdY5o9huQPOa6BOQoOViFQQq1waUt0=; b=EMF6Rbxbm9FOR7+5+VGoInAI9o
 S6CYfikQvpe0AzZDowCLc5w/HKc8CF8/QulkuITXwRL0EmRPdWIMmQ4PRSL5bVZMhIhFDIXHfBDoQ
 +kGsjaSQQhIQqzY5BrVOTfkE7X2f3H3iZL9laTm5jaXwBAxLER8S2WVo53S6kDkIIESY=;
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hSHyV-0086ON-Cj
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 09:19:38 +0000
Received: by mail-qk1-f194.google.com with SMTP id z6so7066199qkl.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 May 2019 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivJjsfdmts+KncdY5o9huQPOa6BOQoOViFQQq1waUt0=;
 b=mLTdlQq6kobQPIS+lihhycrrSegVGwahkaT5q1KoHJ6m1AHqzvw9PZGWZk0joqy0SW
 ee/ncPc34/7FgNYtMUPNf5lLfNkTtJAv/RSqYtilMdesiSRRVMJUsrJZQq6xJgY8Sfv+
 h5nJF1qhibBDFyCcWrnZt3TLFWqK6oJ25aZpnCZpyutgCi62XG+z6VLL4WHcXhFbiek3
 qEu+C8YFPg4dzWIl8LahDYegxxMB4GDEfbmzsSVcJxhPQBL1OlZuWFxbpMhHa1TGVTnO
 CNJ4dy0CasFCPaeP5H9tOs5NMslkAFtRLyMUy9UUzcpSj66FUJzvAtl28654yvmct1bV
 2v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivJjsfdmts+KncdY5o9huQPOa6BOQoOViFQQq1waUt0=;
 b=Nbbg1fNm7l8PqstEONqJWm7M5V6nWTn5plQXG/n2FDKDjg6SRi2+AtrGloH80qs7SK
 vYaIEswzHooGrDjI16YrcR0SIbLGcvIVzWIeSAkzWGHc41p2m/KVwKYHM8DoaUtF2DsR
 kkDFqvwnfsHmj+dD9VNpSBrIyeXuNGQ7GOJaRG03KswRgz0jw0u1ejBbQBZGqHn+WPMV
 Z64vNZhOHVLhK9ueX7AuS9kCQrMdJHRXGfqMI/5lq/e9ITKu5eOsreBLTQrssAfgU3Gj
 G10kuBp07OgB58HVrFp2Qg1a6+5fHM1EhhKIVakWQpMq4U1sepTHGH0eVjHG/CrfYEQG
 MbYQ==
X-Gm-Message-State: APjAAAWJmZXpiBY3CteglRZTzwTwAsN15RE3acbqJcG+iU+IM5wSKwF+
 bNp2zWKOH5WoGBSKHxCXpN7OKFIeivftoXs/3Ds=
X-Google-Smtp-Source: APXvYqytdGV4aaF3+ROnr4okC1VCJTb6cI0Q0Zd9wHFih/IFHlrfZklq8euRMzV2wVkT5KUIsrcUCdRWL95RXNKyrqs=
X-Received: by 2002:a37:a157:: with SMTP id k84mr52853689qke.250.1558257557169; 
 Sun, 19 May 2019 02:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190514093340.40217-1-yuchao0@huawei.com>
 <20190514093340.40217-2-yuchao0@huawei.com>
 <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
 <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
 <CAD14+f1+puy4M6rL_SbGt9vej=7LgK+qEjq71_878=oqSvjJ2Q@mail.gmail.com>
 <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
In-Reply-To: <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Sun, 19 May 2019 18:19:06 +0900
Message-ID: <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.3 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.194 listed in wl.mailspike.net]
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hSHyV-0086ON-Cj
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Sun, May 19, 2019 at 2:09 PM Chao Yu <chao@kernel.org> wrote:
> I've found one bug when repairing cp_payload blocks, could you try it?
>
> [PATCH] fsck.f2fs: fix to repair cp_loads blocks at correct position

http://arter97.com/f2fs/v3__cp

After the patch, 2nd, 3rd and the 4th run all returns the same output.
I think now fsck only needs to run once :)

Final question though, is it expected that the first run to print 62MB
worth of logs?

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
