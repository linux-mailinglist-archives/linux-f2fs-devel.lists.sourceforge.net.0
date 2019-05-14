Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 950461C1F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 07:40:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQQAU-0007VW-FF; Tue, 14 May 2019 05:40:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hQQAS-0007VA-LO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 05:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LX0XaYHmt6JczsEsNVrSRTTBxFWPZ8BYZiJCI1WPlfs=; b=Pzqttt35MzxItkwxiWwfdakf7S
 0e8QrACAUC2wQS0WiGz+7Gj7Asnj3RSznQmFdEcmFw3NfNq8+EQfO7gmxEh5TVSNu1lBnPABxxMN9
 HsXl06hEgDdfWVr1xLuQNOYN5oKlq0Axg9kKhHPNQK/6j7n7tqXWm3qQuRCRet6KS2fo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LX0XaYHmt6JczsEsNVrSRTTBxFWPZ8BYZiJCI1WPlfs=; b=RbWJJvwtwgvZsn0izBBY5keatp
 Cmvz27lnKSyoMOaqEbYYD0cbssn2vA1teaNU2/g5ISu6yxd9Ndw/hJsGJwJi9CL3QWe58lgiZElAL
 uqSkp3xVppysLiVNvLSeivP3sm4L+Xa1/GIjPivLy4TwrC3jPFF/c9Bv9j5KeR7luUcg=;
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQQAQ-00GCb9-NZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 05:40:00 +0000
Received: by mail-qt1-f194.google.com with SMTP id f24so13189041qtk.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 May 2019 22:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LX0XaYHmt6JczsEsNVrSRTTBxFWPZ8BYZiJCI1WPlfs=;
 b=Gekg/ImeDsjdwbPk3/9Rec4Nz+REdcTbuknK61Hxcqut8GFddxQb8OhftCzpwpFmzx
 SLqT9+k7QiUXSoifO0lm/QfE2jSK94dfcZgdaAM9mYzow8Ie+evrF/C4+bhC+QxdEK+g
 RtwGV6qJSY3Det823v7PxQf3yt31hBY7GSxVt7ziPaoS7hNoQ4+9+4XCPMNSeBcJXXhS
 WDqCHNsD9juiWMQFGLajowPD8rNgf6+EJNzXcblGHVU1BK3vjalBgcWebTmxMus4WD7U
 w9PPt6y39A+fAGPB9imEHReWkn+8GrmuSIghIZ/UlQLw1/PDuyKZO+WVg4EeUF+GUF3O
 1aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LX0XaYHmt6JczsEsNVrSRTTBxFWPZ8BYZiJCI1WPlfs=;
 b=LMYp2J7bN5wY5QxL79lUJ0mCz05RwBitdDB9t5UDSnQffsZYtjio7yT3edttr/jKDD
 TuhExczRkf3i2a2ej0fIqy00IchA4uyQOocZpOCEMZdU2JlDmsHZKazvOA1wWv+wIi1i
 m1vOt+sYuAEVG5mUkhYq/psPMJn2pWjjkNpj9XFNQjj4stHZyQhFygL0+smSI0Qirmam
 J6rEciooVBd1MZ1XaNvAFYivIAaztNI8zMi0gSuwF7vWVqj2OTV1Sjk1Cdjm+wjCPmRX
 vlce5osCfYsdSKs2Fmw1t6xgn07O31hA4bVfDUbYN8Iza20BTCA+ME2RfbLwvzpnQOUZ
 mWvw==
X-Gm-Message-State: APjAAAVfpQTDfpLWCC6a5FDApqQeT4iNbVOMre4th0KJY2iMqQBzVZtg
 iR+qhMEfC8EVXmZvnxiGACc1fY7zAqLYalYeRHgOYFbf
X-Google-Smtp-Source: APXvYqxoQmjPOX4z5nn8aA71WQnVuMX6mmygZa/Jn16QvBTxak3EDI/Irrk3FF8KmKluSoI68DkTq3eLvSlzUS57szg=
X-Received: by 2002:a0c:ee28:: with SMTP id l8mr26055818qvs.67.1557812392608; 
 Mon, 13 May 2019 22:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180529205048.39694-1-jaegeuk@kernel.org>
In-Reply-To: <20180529205048.39694-1-jaegeuk@kernel.org>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Tue, 14 May 2019 14:39:41 +0900
Message-ID: <CAD14+f154_t1-TbbSDb9xV_ikDAWfF+8H7aOSK4VF8UmqWRDAQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hQQAQ-00GCb9-NZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: issue discard commands proactively in
 high fs utilization
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

On Wed, May 30, 2018 at 5:51 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> In the high utilization like over 80%, we don't expect huge # of large discard
> commands, but do many small pending discards which affects FTL GCs a lot.
> Let's issue them in that case.
>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6e40e536dae0..8c1f7a6bf178 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -915,6 +915,38 @@ static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
> +                       dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;

Isn't this way too aggressive?

Discard thread will wake up on 50ms interval just because the user has
used 80% of space.
60,000ms vs 50ms is too much of a stark difference.

I feel something like 10 seconds(10,000ms) could be a much more
reasonable choice than this.

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
