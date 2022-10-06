Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A72FB5F6788
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 15:15:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogQj7-0003cD-Eq;
	Thu, 06 Oct 2022 13:15:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ogQj5-0003c2-Si
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 13:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=; b=PwQECgfQ3QFVtccycLDuMmtLhz
 tgWCgIb7QMSix9td96/xCJLHMuJZxaY7dkR7z91edc1hKhdlJWDQQvY5C3ugYUaTmLi1XOyGXHTp9
 AYJbxrwxrUXBvyaMKPGsVR6SmrFrHUMxfAbk9wTttvmitEkLlPtMYv53d2DEFSFBZGCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=; b=NV7lTnmyARfJiFQzwPYS15dtTf
 gjOzO5Iyhm2iwqOxZCX4mWIMsrSPvWC72jmbBK+yC/+AN3WbM8ZwSjRrDTUBbtZbBKXAHdALVuvv+
 DMpbstH9ieRWf/UHOG2Lsjv66u7aggW89bSMov9ZtBGOeTYCx7Fv22MsDxEUgUBxPux8=;
Received: from mail-qt1-f175.google.com ([209.85.160.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ogQj1-00Eizk-5n for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 13:15:47 +0000
Received: by mail-qt1-f175.google.com with SMTP id hh9so896787qtb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Oct 2022 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=;
 b=j4TXfdYhCC5IuPEKT7c142DGOyyUICiYEJ2rQ5pM4q0yiZx4WA0kHStxgeCysxKdIn
 TuxQmiKuGnCh2iLv5lCSAeVvdfZCgr0gslAO6C/wmbiJpJE+HGv9p0BlGAp2YHTd7MAZ
 JFShEKjZddNRI3EB69zxWrjNCIn5FEtT938q5Kh600byBOTgEAyr3Cw5BxKLykg6qGKZ
 putHsZDuOr6KOj1BUasiDhf52tRH/Ed62HmMrAEpEsYDeTWjqgqViGX5p251folDWhG6
 /9qz6hzxVHLZMa8vddlM+hc6XFLs5D7qWuuoVr7OgpiuiN/JdE0keFKPOZzvhwuMVbjX
 g/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=GSOPunDdTF0UIVvBpION9xBpexDiGo+rjOxipFbXtOA=;
 b=yxbfPQVvlq8t0XYdgpYR8jHLty9roFbw5oVBYsUh3BgZKvkijom9Ji2kNt0JfbIma9
 z0dx6gEWg9zFh3NmjxdbXl/7bv/rCYgQxqMkEGPIq3sAVfsV2NWxH8U0/vz3fQIM2/Kn
 y/nfrO2j3eKsgFMvw7yeBDWM5AZH871EbNiMeROliFP7Pb4geDjNN8TmF+j7qd4cJMXG
 oBvRykt/dU6iXCfoE/eWCVr19JBFJBSFx3dVdepNng1+Zpi/lv6RlR0+f0NZnHEEoMTd
 r7iTZatWXq8Ex3Z34EC0MrfGHxkq50o7I3iUnC9252g6fz2ktfexQ07NrCEEkCdTxlIr
 AexQ==
X-Gm-Message-State: ACrzQf3aX07zR5I35Wld+mfAo6YLx76LwozJFFWNjythK4hv0vaXCHVa
 IIVyvEOB0kE/qM33zlYq/hRDSQ==
X-Google-Smtp-Source: AMsMyM4GpHypPhwf4qnIOCDMCCPPCaDHHZXra2UnB6U4hePjwcf7/TKsWZTRJwrBHYFFgt7B+K7zfA==
X-Received: by 2002:ac8:5703:0:b0:35c:c3f6:5991 with SMTP id
 3-20020ac85703000000b0035cc3f65991mr3383265qtw.185.1665062137334; 
 Thu, 06 Oct 2022 06:15:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a0b8b00b006cbc6e1478csm18686320qkh.57.2022.10.06.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 06:15:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1ogQit-00A1hY-6O;
 Thu, 06 Oct 2022 10:15:35 -0300
Date: Thu, 6 Oct 2022 10:15:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <Yz7U99PPl8uHCLFY@ziepe.ca>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com> <Yz7OdfKZeGkpZSKb@ziepe.ca>
 <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 06, 2022 at 07:05:48AM -0600, Jason A. Donenfeld
 wrote: > > > diff --git a/drivers/infiniband/ulp/ipoib/ipoib_cm.c
 b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
 > > > index fd9d7f2c4d64..a605cf66b83e 100644 > > > ---
 a/drivers/infiniband/ulp/ipoib/ipoib_cm.c > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.175 listed in wl.mailspike.net]
X-Headers-End: 1ogQj1-00Eizk-5n
Subject: Re: [f2fs-dev] [PATCH v1 3/5] treewide: use get_random_u32() when
 possible
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, dev@openvswitch.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com, coreteam@netfilter.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, cake@lists.bufferbloat.net,
 brcm80211-dev-list.pdl@broadcom.com, linux-raid@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 06, 2022 at 07:05:48AM -0600, Jason A. Donenfeld wrote:

> > > diff --git a/drivers/infiniband/ulp/ipoib/ipoib_cm.c b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > index fd9d7f2c4d64..a605cf66b83e 100644
> > > --- a/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > +++ b/drivers/infiniband/ulp/ipoib/ipoib_cm.c
> > > @@ -465,7 +465,7 @@ static int ipoib_cm_req_handler(struct ib_cm_id *cm_id,
> > >               goto err_qp;
> > >       }
> > >
> > > -     psn = prandom_u32() & 0xffffff;
> > > +     psn = get_random_u32() & 0xffffff;
> >
> >  prandom_max(0xffffff + 1)
> 
> That'd work, but again it's not more clear. Authors here are going for
> a 24-bit number, and masking seems like a clear way to express that.

vs just asking directly for a 24 bit number?

Jason


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
