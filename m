Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4E569DED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jul 2022 10:46:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o9N97-0004oQ-IQ; Thu, 07 Jul 2022 08:46:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o9N95-0004o5-Js
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jul 2022 08:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXPcq2Af9n7ylka13q3J/GCtVlWN40pJ0Aglu5KRqbc=; b=LpTTJ9F9GTPp/EAK2v8ixDuTwu
 NHxoGFmFqkU7ZYvtod+VO75bD1m/y2v5Oig59kCoEWpAeAdFllLpVTLsgmOjEKEgoX/lJN4Auf+5p
 +nVg6Pvlsia7ghRV6mFEfdvmwrYtbEFtVVOnd4TVYMsonYvbvoD050xXDuU9gWOZSYag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXPcq2Af9n7ylka13q3J/GCtVlWN40pJ0Aglu5KRqbc=; b=dkdgC8Vfw1NNUWY0U+n34s4Bi2
 QgTWuNBSZdFUqyrMvJtSqSPMekFLttwmQGOn9xTMSv7TJqwFS/Mio5PouvJLqoIZT9mn0tsIFrEa0
 x3Njo67X/I/G0xROPKlHltfn369l5wTY1L1uKkCq6J01f4R+q0U2j9mEzwxTu4r1z8jI=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o9N94-0007Yz-JU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jul 2022 08:46:00 +0000
Received: by mail-pf1-f178.google.com with SMTP id d10so4246360pfd.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Jul 2022 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LXPcq2Af9n7ylka13q3J/GCtVlWN40pJ0Aglu5KRqbc=;
 b=VXUhck8efLWgPtTQ4fVFDQtgYpWodkTHrLpwYEVg75Io5kMWwS+q0IqP5kfb4ktare
 2VXSRcQIf5Qu5AlbQS7lPtImczDjhyxtway38Yeheh68MiVrw2i0Pnl1oiUNqFOiMkkv
 7Xb9cfhtqMLU+wXQSX2mREVUEHl5zpVTvTZP9ttBnfXYraUbZ6EhgEL9mv1vi8LyOd96
 ++/qE+vfumUkRYbEiPLPisCYG9NiqQidCNOrD/5YAPbWymKIXNP0AX3J+YUNAF7w/+9p
 r2bFBudKomh8bEZ9oeEFrF1t7G8YpEqqDJ1htmtWHK7UptoEeW+FsYXzdkdn7bRVcHdG
 jrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LXPcq2Af9n7ylka13q3J/GCtVlWN40pJ0Aglu5KRqbc=;
 b=S6T/nRwTjrQYFp/HMwEbdbJMCqzjMtRp0ddZkf03lGqpXxVxKYRtXVXLqJ3pWQ2hp0
 JNuruvgVs7mbd+eeRr9bX8xKyg5bZPtc8LLvD18DDz9hTVKiQwcQe6E/DGQA6TaygFFW
 tj4J+VonQZw4301yMuUtyO/lKHeMoIrKYM/E8X8UO2aWkoovyiQ4o4I0uRPR27HuevU0
 0tOOSOSt+7T90RcTiJMdJiEapXYmi7sAuFs2Chb5yALEI7m586Q786Y+RcLHM3D0s3VO
 YzjtGjcqY73I8Geefu1LlLnlbEf5+r3EvKsLBm3RbK8f8b6nPi2EEPQsZVYXxJg1hHIf
 3xrQ==
X-Gm-Message-State: AJIora/zRA+Gvb4ajDzAE9buGP2Z9hP1rq/K2o0vP7dnDqc7rsEcKWAY
 Om4reIMX4ZTjXXvSzIYFhMY=
X-Google-Smtp-Source: AGRyM1v+T+cWE/QAWB+I4vzYm417qjNCHR4WlkFU2zmXNdtTVuvHPMn7PN08GVceFJMjo7Yj+R7gvA==
X-Received: by 2002:a63:451e:0:b0:40d:c602:4e with SMTP id
 s30-20020a63451e000000b0040dc602004emr38782515pga.453.1657183553009; 
 Thu, 07 Jul 2022 01:45:53 -0700 (PDT)
Received: from liuchao-VM ([156.236.96.165]) by smtp.gmail.com with ESMTPSA id
 t14-20020a62ea0e000000b00525521a288dsm26094229pfh.28.2022.07.07.01.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 01:45:52 -0700 (PDT)
Date: Thu, 7 Jul 2022 16:45:47 +0800
From: Chao Liu <chaoliu719@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <YsadOzTdgUvi/Be2@liuchao-VM>
References: <20220621064202.1078536-1-chaoliu719@gmail.com>
 <7fb689d9-11ba-a173-8ad4-a328a03298a8@kernel.org>
 <YrPq5N61W9vFGTub@liuchao-VM>
 <c181672a-faa2-2f2a-b495-b9c9fee56d50@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c181672a-faa2-2f2a-b495-b9c9fee56d50@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 06, 2022 at 10:27:44PM +0800, Chao Yu wrote: >
 On 2022/6/23 12:24, Chao Liu wrote: > > On Wed, Jun 22, 2022 at 08:50:33PM
 +0800, Chao Yu wrote: > > > On 2022/6/21 14:42, Chao Liu wrote: > [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o9N94-0007Yz-JU
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow compression of files without
 blocks
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 Wayne Zhang <zhangwen@coolpad.com>, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 06, 2022 at 10:27:44PM +0800, Chao Yu wrote:
> On 2022/6/23 12:24, Chao Liu wrote:
> > On Wed, Jun 22, 2022 at 08:50:33PM +0800, Chao Yu wrote:
> > > On 2022/6/21 14:42, Chao Liu wrote:
> > > > From: Chao Liu <liuchao@coolpad.com>
> > > >
> > > > Files created by truncate have a size but no blocks, so
> > >
> > > I didn't get it, how can we create file by truncation...
> >
> > I'm sorry I didn't make it clear. We can create a file
> > by passing a FILE parameter that does not exist
> > to the user command truncate(1) [1].
> >
> > How about using truncate(1) instead of truncate
> > in the description of the change?
>
> Fine to me, as f2fs_disable_compressed_file() uses the same check
> condition. ;)

Thank you, let me send a v2 patch later. :-D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
