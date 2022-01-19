Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C0F493656
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jan 2022 09:29:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nA6LG-0000t3-RM; Wed, 19 Jan 2022 08:29:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nA6LC-0000su-P0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 08:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhke7viFTh+984sDiukRcfEr3dDTzTM2M1AdIWscGkI=; b=ObLvs9u/GmyrnmH+uQund6OULy
 R0Hqioyhd2sVdqs3o3FSexDP7bhBgoRr+vvTz/2fAH5XolxUq1ThqCJB0ojmyiiOhaJHe09WX5eZ5
 US8CDb0QLKzqpTjWz92XQNIQkoVJ/Gk7TIDXG+aeNCEkku3+j7/w094G+PFo7B9FbZW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhke7viFTh+984sDiukRcfEr3dDTzTM2M1AdIWscGkI=; b=BhnJm8HFB64Clo3tMQmBghFgta
 6uxPjp5XubUon0v9o/V4g1V7HMC7FpJD/voFLSu2msmfEieXVSlthZrLI1JFRcjYm62yHtnEMUEdd
 ESoa+i+u50nckfjESySsgGUrDWg+T4NJxXTjtYOb/qG3EFevq+kKNgE7CdPYdMP7gTGI=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nA6Kz-0001vf-Qw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 08:29:13 +0000
Received: by mail-ed1-f44.google.com with SMTP id j23so2469855edp.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Jan 2022 00:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhke7viFTh+984sDiukRcfEr3dDTzTM2M1AdIWscGkI=;
 b=IPaQXqeKWhvXrnF1NTn+04SxablavDfev1QQdPokB1Szeda1ZTHt4AjsyGJo/NfNqV
 6fyseawScGNSvOb4vATPREo2hp2c0ojbGLOA5Soo1sMnw21qUj9LxINE1Dno4m8PIC5e
 TWAB3J5T2CITv32jpTEop26cRpnT6Miv+nYQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhke7viFTh+984sDiukRcfEr3dDTzTM2M1AdIWscGkI=;
 b=qEZmskVrJxtgoZI5n6h54+qQEvrC8ubUWQR+SZttzPdyqsjvpx9pzCFCmjeJ+56CJA
 sJImuyv6kIlOCYwtwszyCOXNkwVTxX7kAsN6jsSNAEqPISmRVtp4iAENibPCIoSJd+D/
 X3pfVMLjJ1NuFVCd1nCuVKKCoj225/y/upZeWg1Sf0M53GnvqBLCcDjtT1JYCRnPS1H8
 QguNcYn/XL4Wi4uERp+y3WK3MoDXsQduZV9w+z32G0FfB6rjnPVNujOyfzoWI+Efe2iL
 yXncw5V88sYlii9lYQy5XiLAb3/ujOfcyLaVY1QHBLQ4uW7ECoyjDeJim23ciBHwMvig
 yZoQ==
X-Gm-Message-State: AOAM532vLGOSI+SXXg101+BnQoVHLbMhsIeDDNrCuIFmrQuYXGD3G2cM
 IlK9CDW7j+9W11FZ8MD7Q6xwVmRzgEBMJbi0fB4=
X-Google-Smtp-Source: ABdhPJxUsTQDj5qVkSZMqm4TA2fVrFWCkgTwnTWX+kQ5nUy9MiSkA7BcUVqq9jZlXRP4fCugCcttBA==
X-Received: by 2002:a17:906:f24b:: with SMTP id
 gy11mr3385803ejb.234.1642580935133; 
 Wed, 19 Jan 2022 00:28:55 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id j13sm873997edw.89.2022.01.19.00.28.54
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 00:28:54 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso11064894wma.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Jan 2022 00:28:54 -0800 (PST)
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr1240895wmq.26.1642580934004; 
 Wed, 19 Jan 2022 00:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20220118065614.1241470-1-hch@lst.de>
In-Reply-To: <20220118065614.1241470-1-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Jan 2022 10:28:37 +0200
X-Gmail-Original-Message-ID: <CAHk-=wjrxHOHPj_U7cOwQZFV8pBPwoppg7iTL=gtr8qGsCf6Tg@mail.gmail.com>
Message-ID: <CAHk-=wjrxHOHPj_U7cOwQZFV8pBPwoppg7iTL=gtr8qGsCf6Tg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 18,
 2022 at 8:56 AM Christoph Hellwig <hch@lst.de>
 wrote: > > Note that a lot of the IS_ENALBED() checks could be turned from
 cpp > statements into normal ifs, but this change is intended [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.44 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nA6Kz-0001vf-Qw
Subject: Re: [f2fs-dev] [PATCH] unicode: clean up the Kconfig symbol
 confusion
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 18, 2022 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Note that a lot of the IS_ENALBED() checks could be turned from cpp
> statements into normal ifs, but this change is intended to be fairly
> mechanic, so that should be cleaned up later.

Yeah, that patch looks uglier than what I would have hoped for, but a
number of the conversions really look like they then would get a lot
cleaner if the IS_ENABLED() was part of the code flow, rather than
have those ugly (and now arguably even uglier) #ifdef's inside code.

And I think the mechanical conversion is the right thing to do, with
any cleanup being separate.

I'll look at this again when I have all my pulls done.

              Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
