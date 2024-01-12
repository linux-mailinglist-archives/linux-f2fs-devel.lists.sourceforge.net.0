Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44482C598
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 19:47:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOMYQ-0007JD-SG;
	Fri, 12 Jan 2024 18:46:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1rOMYP-0007J6-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 18:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4YgfB75CHcjxceeOnVR/ppUWGj8eZS3KKNzpvFvVkgw=; b=byRhy65M6s3zm0wVkWcJmUYpWX
 K24BrbR9embOdr/Ez6HgrdS4BvWzrGZ+E0ftdASIeyhYkXsLTeYa1k9ic0gc6BEmrS8WQKGcybZyh
 8cE8ZBMq1pln6U4VhhIrBr8hZ2GMxf21zzk+EnnuGvTe/MZi5PwytwnPeNaBCjgwsYho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4YgfB75CHcjxceeOnVR/ppUWGj8eZS3KKNzpvFvVkgw=; b=DY2lUxB5C8MOE6/nB5/vY9jUf+
 5pd5gsu77zWCIx5PcdulDz3LR9+HUWxFGtlmmEOC1vwD5O3wZMt2MtxuktTP7tXCu22/lTC5a7q+h
 rflEqrSppEF7C70+Wv77ko5fJkSkoirmaQaO28606BzN2ilZuEMH6lyE1l+A6hYioasM=;
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rOMYL-0006Pi-6b for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 18:46:54 +0000
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50e759ece35so7595079e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 10:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1705085203; x=1705690003;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4YgfB75CHcjxceeOnVR/ppUWGj8eZS3KKNzpvFvVkgw=;
 b=Bgpij0pNVEYr2sTUMZfn1RPucuMpNqn0aNP0tSkffi8Xkhq0F0jXa3lPIShEnLPupH
 HgebofXKNKHUrJVNCMhGoLZzdaycevhkXSPPbCh//5cEyxynYuJK65Kx6ZQlxCrHt2PQ
 pgoFWsE0DYBJ4igDYQzQ98ggrcI2zWfZPtKGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705085203; x=1705690003;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4YgfB75CHcjxceeOnVR/ppUWGj8eZS3KKNzpvFvVkgw=;
 b=PHM9qCDNipuielTwe3bseDRhrd0g14X5XHwM4MB578tyOuYWJ9g38G+gXRmbTc0Aef
 /D9oV/tYinB0uciNvVSNKK9cpWzxEA+t9jM2FTjibLfaGgTTGzN01kk0GAiMJre2sIt7
 zXJze9BQxy61F1k9iDGqOmzUKQY7s/N3Mwp1n6uMD/wqHhK2cI1k2RWtco99lqcq4ubO
 wwCPMmCrsx5f+ApGPjpshHyzGp2N9uhhwaf1azFzUKKvbMIY+14GX7+sLQo7ibUi0cBB
 Y9XSGzGIUNG0FaTUYZhwghk5eEh1iYEoDXU/tFrNdPOqUovqTqSLtNThp6MUO6lUt6JP
 /AMA==
X-Gm-Message-State: AOJu0YxgLV3Q0dfRr3xdCCBF7oiIU7cp4HrgWYOLS4ECV06DU1lS5+Mm
 VxJEfL2XYUzsIlxl91gdvidbRE9f0kjzDVLybbnzzUoY/WoI5loC
X-Google-Smtp-Source: AGHT+IFoHI+T0kosZAvOJfSgZCpIlG1YAFYl8yiPf1HpKfUmmWJWbJP8ECT7XM64aLLvUghRHHAKQQ==
X-Received: by 2002:a19:4f56:0:b0:50e:caab:f1e2 with SMTP id
 a22-20020a194f56000000b0050ecaabf1e2mr833809lfk.103.1705083556249; 
 Fri, 12 Jan 2024 10:19:16 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 mn6-20020a1709077b0600b00a2ccddf9a7dsm790714ejc.124.2024.01.12.10.19.15
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 10:19:15 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-558b5f4cf2dso1644171a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 10:19:15 -0800 (PST)
X-Received: by 2002:a17:906:3813:b0:a27:f2c8:acd3 with SMTP id
 v19-20020a170906381300b00a27f2c8acd3mr803201ejc.94.1705083554611; Fri, 12 Jan
 2024 10:19:14 -0800 (PST)
MIME-Version: 1.0
References: <ZaAzOgd3iWL0feTU@google.com>
 <CAHk-=wgTbey3-RCz8ZpmTsMhUGf02YVV068k3OzrmOvJPowXfw@mail.gmail.com>
 <20240112071242.GA1674809@ZenIV>
In-Reply-To: <20240112071242.GA1674809@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Jan 2024 10:18:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjwL6bdmvdLu2CB=OmD3Dkr=ENATVsk6mE3rpZ-tavktg@mail.gmail.com>
Message-ID: <CAHk-=wjwL6bdmvdLu2CB=OmD3Dkr=ENATVsk6mE3rpZ-tavktg@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 11 Jan 2024 at 23:12,
 Al Viro <viro@zeniv.linux.org.uk>
 wrote: > > Where would you end up with old_dir_page != NULL and old_dir_entry
 == NULL? D'oh. You are of course right, and I missed that connection. Happily
 my merge still works, just isn't as minimal as yours. 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.42 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.42 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOMYL-0006Pi-6b
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.8-rc1
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 11 Jan 2024 at 23:12, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Where would you end up with old_dir_page != NULL and old_dir_entry == NULL?

D'oh.

You are of course right, and I missed that connection. Happily my
merge still works, just isn't as minimal as yours.

I see that Jaegeuk already posted the patch for the cleanup.

              Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
