Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8745B4FDC30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 13:02:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neEI6-0004bZ-3W; Tue, 12 Apr 2022 11:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>) id 1neEI3-0004at-6E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VYlSwRs2xXTAAyUlwb+gbXuW16FUgB8AcvnUgAkw87M=; b=F5MunA0rmuCNIlk0nwFbWEjUJY
 FYpbv3XzDgNN63EAgM8+1Fu0JaKUqNkzQ3Ax4u8FiyWf3jDhPOEFJ65yLmojtvlor5AmnvplZq19S
 RPA1z4jv88tx0IdfQPZl3nVPptC24kmzqjCpR4bxGi85OoHmuKVYfpB9mxPrLdKnYLjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VYlSwRs2xXTAAyUlwb+gbXuW16FUgB8AcvnUgAkw87M=; b=aKhmNqUUUxi42IUvOM0599JNP7
 1wWt5ShhGZQKHoQYzhRAbXxqZKPLKOHvtN3ktFeaYQfyQYHmalpg6vxzhHw6TYAia0K0SBopnZsoT
 eP56wntxX6NoDkJVNaKrC8Bzcv3WVmvg4MstfTJa0VJEqunwC5Af4bXYhMvIv6+8lnVE=;
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1neEHx-0006ct-4E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:02:30 +0000
Received: by mail-ej1-f48.google.com with SMTP id bv19so13546329ejb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VYlSwRs2xXTAAyUlwb+gbXuW16FUgB8AcvnUgAkw87M=;
 b=eSbceTFB98b3Z4e++6Y2eKyh0djI4T4ned0/KGkHF4WkQ2ae1MrCfN/x1DtyjdQ9EK
 I6uRjCoOv2AxG0UVJB0EOUOEcKG1gRlCsYmqXVCMaB1783YxmdMMk9Er1euKcvHliDpE
 tRH2iCH/Aaoe6tasaDrdqEiifWeCJ3oo0c8Gps11Zz8r3CFiu+WckRFSke/7vQpAhA39
 SdyWjtnFobiiFiq0baedSX18wfT0ay8xSeoyNDUUujyaFI7DfjEyqROymvDx4JAbt5cB
 Q9dW0CrEFyWsiFUbVC+RGVEBAtPjMno47ARxUA30DU7nZ+ZhEguqThGbutt1Rd0YYr/W
 YCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VYlSwRs2xXTAAyUlwb+gbXuW16FUgB8AcvnUgAkw87M=;
 b=h2PL9YfQFEZ4T/oPsFpSEEsumNI3osUr8/RbS9b7eMdZDJ9jynd7TkOfA3+YcGj2oi
 bTH1bta98d5okJd7vXcvIXNylUogGbxEORrFIkE/XDhcXwOMbrm8j2xFxsOCzzmemTxR
 XPJ2ok8Xg6gDjRMwIYtG3ufj7BusijrkkgbGDSmr1AY3r5jgeIKZUtC4xx/6INgsoeyL
 GX44f3n6Ml420fozLj4shR7nc7i9Z62YNDNFX0B6vdy/9z7i3X7Ce0t+L+gmpn5Qp7s8
 +1TiFnwEbpQop8HOqOeWxHVi6xI2TgpoGxipkaB5UFvGycAa8yw2re55gSJIPaUnVBoH
 FBQA==
X-Gm-Message-State: AOAM531DKYwOFsHCJqnsrhlTzZrjAXJhJEWZxGXx1mdTzIfk1D7RHVxr
 FUwNYADAhmF0dkG9h/Uww4ue5Z9/P0AJGg==
X-Google-Smtp-Source: ABdhPJwPcRInSEEVAplx2Q7xSQldnlj/l6p5lEplZaCg8iRKCy5wsP3rhJrj4lvajacO3js5nLJNfQ==
X-Received: by 2002:a17:907:d04:b0:6e8:8cbc:e86a with SMTP id
 gn4-20020a1709070d0400b006e88cbce86amr9739701ejc.194.1649761338744; 
 Tue, 12 Apr 2022 04:02:18 -0700 (PDT)
Received: from smtpclient.apple (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm16990227edz.35.2022.04.12.04.02.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Apr 2022 04:02:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <4d54f494-b143-8885-a31e-924a83409e2d@kernel.org>
Date: Tue, 12 Apr 2022 13:02:17 +0200
Message-Id: <632AA316-A1B4-4E2C-B5FD-204FD3BE8633@gmail.com>
References: <20220331221650.891790-1-jakobkoschel@gmail.com>
 <4d54f494-b143-8885-a31e-924a83409e2d@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 12. Apr 2022, at 11:40, Chao Yu wrote: > > On 2022/4/1
 6:16, Jakob Koschel wrote: >> In preparation to limit the scope of a list
 iterator to the list >> traversal loop, use a dedicated pointer [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.48 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.48 listed in wl.mailspike.net]
X-Headers-End: 1neEHx-0006ct-4E
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use separate list iterator
 variable to call list_move_tail()
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
Cc: LKML <linux-kernel@vger.kernel.org>, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On 12. Apr 2022, at 11:40, Chao Yu <chao@kernel.org> wrote:
> 
> On 2022/4/1 6:16, Jakob Koschel wrote:
>> In preparation to limit the scope of a list iterator to the list
>> traversal loop, use a dedicated pointer to point to the found element
>> [1].
>> If no break is hit or the list is empty, 'next' will be NULL and
>> list_move_tail() should be called explicitly on the head directly.
>> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> ---
>> fs/f2fs/segment.c | 12 ++++++++----
>> 1 file changed, 8 insertions(+), 4 deletions(-)
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 22dfeb991529..81ef2c3d08e5 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -4175,16 +4175,20 @@ static void release_sit_entry_set(struct sit_entry_set *ses)
>> static void adjust_sit_entry_set(struct sit_entry_set *ses,
>> 						struct list_head *head)
>> {
>> -	struct sit_entry_set *next = ses;
>> +	struct sit_entry_set *next = NULL, *iter = ses;
>> 	if (list_is_last(&ses->set_list, head))
>> 		return;
>> -	list_for_each_entry_continue(next, head, set_list)
>> -		if (ses->entry_cnt <= next->entry_cnt)
>> +	list_for_each_entry_continue(iter, head, set_list)
>> +		if (ses->entry_cnt <= iter->entry_cnt) {
>> +			next = iter;
>> +			list_move_tail(&ses->set_list, &iter->set_list);
>> 			break;
> 
> return;
> 
>> +		}
>> -	list_move_tail(&ses->set_list, &next->set_list);
>> +	if (!next)
>> +		list_move_tail(&ses->set_list, head);
> 
> list_move_tail(&ses->set_list, head);
> 
> Then we don't need @next variable, right?

Of course yes, good spot! I'll fix and resend a v2 in the next days.
Thanks for the input.

> 
> Thanks,
> 
>> }
>> static void add_sit_entry(unsigned int segno, struct list_head *head)
>> base-commit: d888c83fcec75194a8a48ccd283953bdba7b2550



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
