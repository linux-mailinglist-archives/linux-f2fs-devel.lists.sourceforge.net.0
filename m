Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA159EDF7D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2024 07:31:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLcjC-0005EA-W4;
	Thu, 12 Dec 2024 06:31:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dan.carpenter@linaro.org>) id 1tLcjB-0005Dv-Kh
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 06:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wdk5mwj9oPpJlVtb093wBGQVMuKiQeDOvo82XEuEwwE=; b=hyAFL85ag476xmpmTP7LABIMwI
 CLoUI8k81l4BLuWuuTLy41tAWxo9bAoxEMJ01L6aExmaeEl6kScAWeL9jgSCdabMca9ahSJURhsDo
 9G6jbtBU4EENqvzmDNWo/fhg/tSobHbHBbhDaMDZh+fm/QEMETOWmD10SexDr0TwP9es=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wdk5mwj9oPpJlVtb093wBGQVMuKiQeDOvo82XEuEwwE=; b=UBak/4Xl0kqtdzWrNdWHPgTcqK
 iIpskX5te9ZkCMdeVSlLI8XYrRvQvD7NRZFSU0+0xywLJ5dDVDNb06RedXFQiXUi3nZ9RT3Uw74VE
 +YwDpUzL+qpp07OPp6l6l6tzHOn6WYpCJbP8u6KseqSiRphmvQbWKryAmBzvQWQ+CC78=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tLcj9-0000eK-QL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 06:31:13 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4361a50e337so1333625e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Dec 2024 22:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733985065; x=1734589865; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wdk5mwj9oPpJlVtb093wBGQVMuKiQeDOvo82XEuEwwE=;
 b=x1m+qXMYNHGCHg7SxtTp+FlM1wnEc9PHqQrjDfKdXKh0NLAUSu0i0GHSr0ygy9NLpr
 iZxf2ozMOXJ9xoIxHWZnXSBR3M/sl+L5TGqOFGCCr924uJwmOt9fr3OAJ7jDS4MvijeH
 oLpjgna9eT89YaltG2TpU2KDbmGV+mzFBx4/ibXHoc1wm3/94prshvh5MQaBtOPtE1bX
 56d36BUyQNUQFh155IOL/NOWuIsY6VkPgRjZ+l/rjJpEnS6c18WYxJCduMe/ViXOloLa
 F8BT0nlhkpCaVIYlWqLJbIRMNHdvH84sIjTKWl2TZnEYK6yyzzxpW390BQAQA4jn7fJI
 Q/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733985065; x=1734589865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wdk5mwj9oPpJlVtb093wBGQVMuKiQeDOvo82XEuEwwE=;
 b=K2pfUj75gKhl3M4TjDb9vYrBptRxU4einQABgMNEpSeAHpH4TfNSP2ByljpF7n1lLB
 RgGD2dVbixffRouVe4R3Q7iYlpOGLHuWAT/86LHzw0+E6+9oMu1F/91zCTq8dtCR8KEC
 TR/26uAH+5YHPwqNMzg9dAXZo/kCvImpJZ4mufaRNlnnSJtdNwM8tK+fI/JvCKjnU73B
 yr0NcKMZEqwcJgUcTJoIHfLR1mJjb7LkKx1RVbYsl2V2HIoyZZ2rnvQUBWMDhxUcQVnA
 h4rtVqhvmom/5YJ8944UW4FcExZ3dgfJ6W3aLUreA7u1C0R/LU+PPr4NMubwenzjjhQd
 IZ/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNkfxOoaLpvhO3xDh9dCB2+V+Gbfw/Y8StAEeRu7AfWXNgyC4r/BSLLSNvoRPLqp84G7DO07ml+q9FReROZJIE@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyrg92uVn1YGtESX0kKSEeB7gpkbO6QixePn4bE8QmYzfh76xBM
 SyhKGZ7EvsgJ/NwFsJPkFq6SIgtitzLQOwoHECg5jNp3EuUYor7AeEL1myePQSQ=
X-Gm-Gg: ASbGnctUzRxSKtmkrXEhKmRm+OTm/LxDS8Ff7s36CC45vJdsopjFseFbrVrnZwHFb0Q
 AVKHFVQ74qnHqu28np+rQ4h6cziKF1nYZzN878/K27BR42XKXPOCWUNdG4JP/t0RVCnmOGS39+j
 0SmctxLx1GKjOIgt+Kf6g0QilrPb3NOp1OIWDGnH9c+Ula86Mquhq7jWuxyAFtP8UjEaoOKI0Nr
 JTB/bAiz0Ct0dUS0iiOcv2e5Ljw5NLixvtwQFhCdFFcbH2OI0YlLj2cfSgZFg==
X-Google-Smtp-Source: AGHT+IFh47uwV1k6ja045AtMme3ZSND7FaMgkXxQ8uSMkb7peRH8YY6TZ9EvoYikamy2Sx0aIhJQAw==
X-Received: by 2002:a5d:6486:0:b0:386:33e8:20f4 with SMTP id
 ffacd0b85a97d-3864cea578cmr4664052f8f.59.1733985065245; 
 Wed, 11 Dec 2024 22:31:05 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625550555sm6658685e9.5.2024.12.11.22.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 22:31:04 -0800 (PST)
Date: Thu, 12 Dec 2024 09:31:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yeongjin Gil <youngjin.gil@samsung.com>
Message-ID: <644671fc-b35d-4c53-ae25-356963466339@stanley.mountain>
References: <CGME20240819083433epcas1p3861b773a5b21eea6f0332036a71bb5d7@epcas1p3.samsung.com>
 <20240819083430.31852-1-youngjin.gil@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819083430.31852-1-youngjin.gil@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 19, 2024 at 05:34:30PM +0900, Yeongjin Gil wrote:
 > In f2fs_do_write_data_page, when the data block is NULL_ADDR, it skips
 > writepage considering that it has been already truncated. > Thi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.42 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.42 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.42 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tLcj9-0000eK-QL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: don't redirty sparse
 cluster during {, de}compress
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 19, 2024 at 05:34:30PM +0900, Yeongjin Gil wrote:
> In f2fs_do_write_data_page, when the data block is NULL_ADDR, it skips
> writepage considering that it has been already truncated.
> This results in an infinite loop as the PAGECACHE_TAG_TOWRITE tag is not
> cleared during the writeback process for a compressed file including
> NULL_ADDR in compress_mode=user.
> 
> This is the reproduction process:
> 
> 1. dd if=/dev/zero bs=4096 count=1024 seek=1024 of=testfile
> 2. f2fs_io compress testfile
> 3. dd if=/dev/zero bs=4096 count=1 conv=notrunc of=testfile
> 4. f2fs_io decompress testfile
> 
> To prevent the problem, let's check whether the cluster is fully
> allocated before redirty its pages.
> 

We were discussing how to detect these sorts of things in the future.
Presumably a user found this by chance?  Xfstests has two tests which deal
with compression tests/f2fs/002 and tests/f2fs/007.  But it feels like
xfstests is not really the right place for this sort of thing, it would
be better as part of some sort of fuzz testing.

What do you think?

regards,
dan carpenter



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
