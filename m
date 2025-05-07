Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CEFAAD84C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 09:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65fRSJ6c90W+4xtzGR5d5QSpx/uu0UX/s5z4B8pTin4=; b=LBppiBL5PswH/OQ8sU+A3/v8id
	j+4xFGYUv7ITXLd5w/l272u1ks4wvzbx2P7kWBSMOIcwn7Q84ZhT2g4Ny2BkbQOdaHXQ+r5inasm4
	TLPseLsnVXMuRL3RB9gVxfmq7fMBmyFOsVRtXAAQF6hVXIsULX6Xume85Z1C2pknKPKE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCZLK-0005fF-Ih;
	Wed, 07 May 2025 07:37:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dan.carpenter@linaro.org>) id 1uCZLI-0005f9-8I
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Ub86YOiduEa/eVSMY9MAo8HXkSYXaaRZGkMD4q/bgk=; b=fppwk22pq+/Xazd65cx7WmEylP
 yO7V0LWEmQ9Nk4Px136kZ83foqKjvbQmI5bg6UH63Eny3Bo+Wv5scJyWJW7EeP/XKAWNuIQ+142AY
 KtAJfmRYdLKVXSeAnjbSz5U2LiimvaoZRSftoOON3W8jg5p7T5rgjVeKtemicrVmeT8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Ub86YOiduEa/eVSMY9MAo8HXkSYXaaRZGkMD4q/bgk=; b=Ci4Yh+EhSdSOCPxdm11Z3jZ5NF
 VzgiWEvV5N7gv8s5KB17S4KxYAcWvmuQNS0qkcF705uWjegffNzNJFKZculrO6pYUvReHXyTwvqiz
 3VfOsiZe1szDXExIdw4DeSjrZ4oVGac0b64LQBEsg7sOJ0/3QveZpysTayX3nZFgvyCI=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uCZL2-0003E6-K5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:37:24 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30c44a87b9cso52755031fa.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 May 2025 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746603417; x=1747208217; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Ub86YOiduEa/eVSMY9MAo8HXkSYXaaRZGkMD4q/bgk=;
 b=rkDW3/RztnLhqrJbzCTBr/VPModmcKk9TMvJ4VJjezy9R846G3lb6n7uUxbuu1Dd8S
 IjxiwcPmyGeZIYl5cIgLiH8ApC7ZJ70QNcQ8FBms6NnWmzyFYAtslKKOrCgAuVzvI0jC
 MvGizayojXwUlmUN/LJe7SwGy9Plu8etxIy1PuBZ4Y9SjWXsWRX2pqfUMzwaVQcT8VDX
 UDuL3xb9HLS8G9VAvtkVq3IOSS/DC5R/cn1JAgG7jjxzVV1F+JqxMVxSoYHG8Jqo7itK
 umI2V1pmMLhIqraqi+Eu02ydOp8Q9K5YKYQqtHqVszelo19OCnhqsVWz3FHWdy6xVcAL
 8i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746603417; x=1747208217;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ub86YOiduEa/eVSMY9MAo8HXkSYXaaRZGkMD4q/bgk=;
 b=qW6E2CeDSU3P84Tq5vM6VXvGmI+P18RLvF3Ou93LinJZjvjJydIWZ8jnl/hd1wf8YQ
 Is1QXaUIgLAJ/qRuU3Qb2Z+4LfANWvgPPcTEgU0rA6a6Lslm3pSfCWHXLWeGHYd5DQMY
 XBIw3MTPW1g8CnkN1N5IbNEYvdqcRJHz9zun17FGiyrvbqy5QffKoy8R7gVidRI33tIc
 90OXIbWrtSBmdww/i6gD9IhaViYeO6e7MExOIMfuBlhY3Xq2CBU2sSaLV4z7QBagX7rq
 O/wW8L/6Y2yHMsP3C5w8d3nx0CbNalnRl+NM0J97uQTR5bWcvOeiXCleSx8SoRzj8C5b
 zbHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPZnvX22u3nlja5PtJXSavOxw33bzC/y6IAgB+TW82Tz194gPlXqnw/TQzcqb8IvRRS6IVJlMP4COujjMAGFM4@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzKupFIJdu7hBHAYdWPbEnLwIrmNMnljAPLg1xrYpalYD+po+9v
 sUlx1XzVNeNJIEHqPeiUrdVlTwemoxQpJMTjDtGVTEgnzEvmZlUjI10Z7hP3NtZe/YNUbTBbRo5
 X
X-Gm-Gg: ASbGnctEhxTbwuI9BvwxNNco28eq4CeSKITo5ENCH43puKhfRUSurci6DTK/nqjfOuN
 P0tMHvcCzSYtA2iqhJc4f+rJnvfNHXhPevlqIaUkC9gZZO+tmCCiXGhIGRNAdZZ+1X2wWPEQYFY
 vY4NN7t2/F2/0whE7Fiu+ljuGXKO6s6CDu8ZWSQU4STX9WzXAAUuaDaLzeRw/Y8RvFEerXDSHoQ
 tIkphm4L3O/eeoalPYCgHYcGcNjLkg7DUZ8aTQFtDEka2Fbi2Rz531cOwnNdU1LmdD9PPiC4/HL
 qbiiZMQNdsjhM8Kv84FphLQ6CliO4qlB3RaDtjH/N6z7sg==
X-Google-Smtp-Source: AGHT+IEmoeAGWQWbDCWdXNoR6Qtv1PE9ocGTUGfOHUL/Pmn8lfNeHcp0Heb5W9i0py8vZaA77H3w/g==
X-Received: by 2002:a5d:648d:0:b0:3a0:a198:83cb with SMTP id
 ffacd0b85a97d-3a0b4900d83mr1636870f8f.0.1746603098009; 
 Wed, 07 May 2025 00:31:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441d43a829bsm21466155e9.40.2025.05.07.00.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 00:31:37 -0700 (PDT)
Date: Wed, 7 May 2025 10:31:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <aBsMVmWzpHwCjn8F@stanley.mountain>
References: <aBR_H0zPfg5Sbj4z@stanley.mountain>
 <75dc33f0-7415-4d73-8f0e-6887281bc35f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75dc33f0-7415-4d73-8f0e-6887281bc35f@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 07, 2025 at 10:59:11AM +0800, Chao Yu wrote: >
 On 5/2/25 16:15, Dan Carpenter wrote: > > Hello Matthew Wilcox (Oracle),
 > > > > 1768 /* reference all summary page */ > > 1769 while (segno [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.170 listed in wl.mailspike.net]
X-Headers-End: 1uCZL2-0003E6-K5
Subject: Re: [f2fs-dev] [bug report] f2fs: Use folios in do_garbage_collect()
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
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 07, 2025 at 10:59:11AM +0800, Chao Yu wrote:
> On 5/2/25 16:15, Dan Carpenter wrote:
> > Hello Matthew Wilcox (Oracle),
> > 
> >     1768         /* reference all summary page */
> >     1769         while (segno < end_segno) {
> >     1770                 struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno++);
> 
> > 
> > One time email warning etc.  I could also mark filemap_get_folio() as
> > a no fail function to prevent false positives.
> 
> So, it doesn't mean filemap_get_folio() never fail, can Smatch detect above
> condition to avoid triggering warning?
> 

Thanks for looking at this!

I tend to not worry about false positives a lot.  Only warnings in new
code should be considered as real, everything old is something that we
have reviewed and ignored.  If people have questions they can look it up
on lore.

regards,
dan carpenter



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
