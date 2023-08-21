Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA07833D3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 22:44:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYBkj-0003bj-Cx;
	Mon, 21 Aug 2023 20:43:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qYBke-0003bZ-9d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 20:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6TY2MN0lhHPejlOUsGrvoal+X6e1qLwPBJsLfM1wERc=; b=VJdE0Rkm4psYp+HfgapTqAYXbp
 IqkfW+nu2YIRJtimSQuHS7335HdxNr/o2DKYL5cNz2E2gi2WC9Ta2/A59P2UB0vSf4iWKCJPO8RUd
 nFog4viQeGCIB4aSHlfYqUX99g9PoCSQqCZHLlrhrPuzn9lpeJcv57sxMa2yv4I58MdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6TY2MN0lhHPejlOUsGrvoal+X6e1qLwPBJsLfM1wERc=; b=UyiFCUmMNNbEi+PqEzU8xOn0TB
 Okpzhq0nu5rUs5hLjUKL3tfKgFYsU575h1BVtsHB/kgBI87VkTyYl+p2jh/VrBioRpr1RQgioXFg5
 +zYqVBqK9pC7LZJU583YjTSd2gggs7A2avnuQL8i/sy8fvbQg0z4Z5SkBh1grBnULPb8=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYBkb-00017E-GY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 20:43:53 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-26f51625d96so743367a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Aug 2023 13:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692650622; x=1693255422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=6TY2MN0lhHPejlOUsGrvoal+X6e1qLwPBJsLfM1wERc=;
 b=aCc3Z6uH1TJMmsuUa6iJpdcpQltCpuOH7443wj1+PxLAcxguQs3SEu2gmLPuq32jxP
 p1W1H6jggv3hlD+a8a+BTVI6nfERlU3QSX9bfve2MRYcGa6BCgyRaauVYcr7lTncHQHo
 HIyJD21FG1l3g3YFhFBP93ldMMZ0yAzENDDNSA2xP4QkYBUPudR8aGJxn1D/wdq7VoDW
 uwirgK19rxUWp/2/QQghul2UH8qOYboWQd73E6IaTMzhslpfUljaF02IDvHev/hRnwa6
 2IhsRHzw0tiFPl3ed+Qknx+l0L4kUQWEQqegJI1FMYhRMjwy+EksZ/tlywycv7V8q6GO
 NLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692650622; x=1693255422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TY2MN0lhHPejlOUsGrvoal+X6e1qLwPBJsLfM1wERc=;
 b=VqfEOYHCvuUgnkmolOD5YLFiTNPqaLSnBUrkHxxebgoBcn3oCtAa6NsIode8U4+4Br
 RY2Yj0qBayxFitV0f47J7lvIcEc50uQolr2/YsizU+AvkkgRFZ8ZKKCNAyZm/+BtI706
 Up+rmIV69kLIGhLeLIRXFleUbt6Jos0DAcOTYxqfQtn0ExkVt3XPnGTEa9C09MFO0YHf
 vTBNw7EWxepRtrJgHAnM0yUUCaFjRedPH3eexOT7RpuKXWusGxXsywgnv9x4MrjdU9i9
 Q2nYYb/2MdyduGaedDCRSZ6X9ejsID/m6JsXNooTNuTlZhuTcBNkx/rKV4EfRyHftP1X
 2vbg==
X-Gm-Message-State: AOJu0YxmNehCJSaXbdqvgL5H1RM5geg3JpiZ0NVjdJe47NYVJsXEJ7my
 jlrJbKgXHUT9v7YvsM9LniJMyxWcLaE=
X-Google-Smtp-Source: AGHT+IG97LKnjt9cY+NxG0IiSBcJyGznfU9YoawlwUW/CigMO4MBDfuVQEYQzHxVNHjDlKqn6+gYTw==
X-Received: by 2002:a17:90a:f98a:b0:268:2d92:55d3 with SMTP id
 cq10-20020a17090af98a00b002682d9255d3mr4799284pjb.39.1692650622017; 
 Mon, 21 Aug 2023 13:43:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b001bc930d4517sm7483919pli.42.2023.08.21.13.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 13:43:41 -0700 (PDT)
Date: Mon, 21 Aug 2023 13:43:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <6ead6655-09fe-4c56-8ab6-02fcd04a721b@roeck-us.net>
References: <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
 <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
 <20230817155319.GA1483@sol.localdomain>
 <700c2e58-d2fe-47c6-85a8-aa7f7b1613cf@roeck-us.net>
 <CAOtxgyedoExF5yfJO6BkU6fYjJMpfJBDuEuG_2rjyT7o9qcX4Q@mail.gmail.com>
 <ZOAOTcUAskB+F5ez@google.com>
 <22fab316-237c-4363-b968-96e8307cdd59@roeck-us.net>
 <ZOO86IYpjfnidag6@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOO86IYpjfnidag6@google.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 21, 2023 at 12:37:12PM -0700, Jaegeuk Kim wrote:
 > On 08/18, Guenter Roeck wrote: > > On Fri, Aug 18, 2023 at 05:35:25PM -0700, 
 Jaegeuk Kim wrote: > > > May I know if this works? > > > > > [...] 
 Content analysis details:   (0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1qYBkb-00017E-GY
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 21, 2023 at 12:37:12PM -0700, Jaegeuk Kim wrote:
> On 08/18, Guenter Roeck wrote:
> > On Fri, Aug 18, 2023 at 05:35:25PM -0700, Jaegeuk Kim wrote:
> > > May I know if this works?
> > > 
> > > https://lore.kernel.org/linux-f2fs-devel/20230819003012.3473675-1-jaegeuk@kernel.org/T/#u
> > > 
> > 
> > Yes, that fixes the problem for me. That makes me wonder, though:
> > Why not just use the _nested functions unconditionally ?
> 
> I think we should ignore that in this case only.
> 

Not sure I understand. If CONFIG_DEBUG_LOCK_ALLOC is not enabled,
the _nested functions map to the standard (unnested) functions.

From include/linux/rwsem.h:

#ifdef CONFIG_DEBUG_LOCK_ALLOC
...
#else
# define down_read_nested(sem, subclass)                down_read(sem)
# define down_read_killable_nested(sem, subclass)       down_read_killable(sem)
# define down_write_nest_lock(sem, nest_lock)   down_write(sem)
# define down_write_nested(sem, subclass)       down_write(sem)
# define down_write_killable_nested(sem, subclass)      down_write_killable(sem)
# define down_read_non_owner(sem)               down_read(sem)
# define up_read_non_owner(sem)                 up_read(sem)
#endif

All you accomplish with the additional set of #ifdefs is to make the
code more difficult to read.

Never mind, I guess this is your call to make.

Guenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
