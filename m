Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A65913011
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Jun 2024 00:08:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKmQE-0002rq-Pz;
	Fri, 21 Jun 2024 22:07:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willmcvicker@google.com>) id 1sKmQD-0002rk-DV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 22:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qlrUdHgGXihL/s+EgvCZEvEZrMZokYDaqZqpEHg6XbA=; b=Etmxoo3FSfiOrtWUbua1z0TKCg
 9KaX721CPIoeGoHhii/tUJsp5e7lpfgs0BoyRXyUR6AIWUk91Jvqzir5nr6JwewUoyNB3TALjMPLE
 jIeaBQdOx7ZWTdGxpXq8XLfDW8y9sddRr0CF4Bf4sKQgI+acGKEtM+N85Jsa7KIyuJfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qlrUdHgGXihL/s+EgvCZEvEZrMZokYDaqZqpEHg6XbA=; b=SWHSq7A+GKAJFyubdRDd8rKrvy
 Rlq83q4uHeW8lWfiN7P00rhllNkyK9NAEqfK06mm/4HnRZ1OxOv4s6eif23WAJMMojXb3l33xifW3
 J5+yUIJe+J0MG43Nhv7oq0UzJvGR0TLN4YL0wXg4DGt8/gIutn/0K5Nd8L6kVEAr6t/8=;
Received: from mail-qt1-f175.google.com ([209.85.160.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKmQD-0004iF-O4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 22:07:53 +0000
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4405dffca81so311011cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Jun 2024 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719007667; x=1719612467;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qlrUdHgGXihL/s+EgvCZEvEZrMZokYDaqZqpEHg6XbA=;
 b=r6OC/cFWahmVnZMD08Kbo9bvKA25nem5BU907qYAxhfKEWXAD+dt3nFQlXouR9vYHi
 zw3uGoTyyZGCe1dCFeHglaJx0g8J3SQkJHRCuwlCSJaK2c9dIdrCeka7NklSJgVAlgCD
 NhavtvmChs9aBPEmFHor7nqbWOpVqG2160chWYPBusBLZiMQ8/vJjg8J0X1SatxjyUp6
 TEqnBjkENWLUrlPOVojtDFe2apnUtcw4JTWq5sIR/oY9veP39brMerV1Qmzw1YY0YARS
 Ir7e0AstK9XXwM+9MQprpkhkTayf5mG6ULt5RNQGnVEP54dRccTcXX6Cs5QKSwgHGI+L
 Vz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719007667; x=1719612467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qlrUdHgGXihL/s+EgvCZEvEZrMZokYDaqZqpEHg6XbA=;
 b=cXJ6nnp0x80PYhLgMbry76AwsL35arCNhz+sUZSdtbocTmRNYafjheAphwz3unD8ux
 w/t8eTFILwXQ3L65GO916iWBQM9gtfD5y5V755YdMvT0M6SmBx1RkmFjAYuMRmNZSCKS
 gQqAESizMqoTNma/e0lu3WgJxj/YipLfqu740L1GpQLFPZC1u5tO+FawRaWI/dNQFSB/
 6SHiqpRQQeKRm9IA2Y5D6nyJ3V5CHDB55w6xXu3T0WYsM6jO1qlh47fm9hmG32r0GH5D
 POeyg2dT4fJVXjDoee5lDAvBjHgdVJVkcUTukORFQzjDsjpYQ+yyIGMWkDNpqzhTKWLW
 WY7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaXku0Iukkamr4gHhyMpoJJlb0CkeIU5ORm9DnHXMCE6jY2yhdGt7KmZJs4MXsvO/LlvNMq6dSfSA6oNLZGrIi3dGGmTX45lCq8YXjuuV86aipmw2wDg==
X-Gm-Message-State: AOJu0YxYyWjQsLFqeflNVI2rU8IBOdyZN8XsKsE+I2/A0CQsp/2ZKFzo
 Bi6j6Ig/OfWfZ9xe92G03p2Igr41rciNleeVXdTsq1mqyUEZhRNuVfpwblpLLcYjIf1woqZRwqz
 y8Q==
X-Google-Smtp-Source: AGHT+IEx++ezoVub5SOEh9xhLwbBZL8BdR18TTcUskjdhukEtqq4FP0yVpR6/gM15x7oUCPPTDXFJQ==
X-Received: by 2002:a17:903:294c:b0:1f6:7fce:5684 with SMTP id
 d9443c01a7336-1fa09edcad2mr522365ad.3.1719005785564; 
 Fri, 21 Jun 2024 14:36:25 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70651305157sm1862472b3a.208.2024.06.21.14.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 14:36:25 -0700 (PDT)
Date: Fri, 21 Jun 2024 14:36:21 -0700
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <ZnXyVWsUpY4GywNY@google.com>
References: <20240618022334.1576056-1-jaegeuk@kernel.org>
 <2cb67503-d974-4db2-942d-b68b69de9447@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cb67503-d974-4db2-942d-b68b69de9447@kernel.org>
X-Spam-Score: -20.3 (--------------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/19/2024, Chao Yu wrote: > On 2024/6/18 10:23, Jaegeuk
 Kim wrote: > > mkdir /mnt/test/comp > > f2fs_io setflags compression
 /mnt/test/comp
 > > dd if=/dev/zero of=/mnt/test/comp/testfile bs=16k co [...] 
 Content analysis details:   (-20.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.4 HK_RANDOM_FROM         From username looks random
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.160.175 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.175 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.175 listed in sa-accredit.habeas.com]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.175 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1sKmQD-0004iF-O4
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr
 is valid
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
From: William McVicker via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: William McVicker <willmcvicker@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/19/2024, Chao Yu wrote:
> On 2024/6/18 10:23, Jaegeuk Kim wrote:
> > mkdir /mnt/test/comp
> > f2fs_io setflags compression /mnt/test/comp
> > dd if=/dev/zero of=/mnt/test/comp/testfile bs=16k count=1
> > truncate --size 13 /mnt/test/comp/testfile
> > 
> > In the above scenario, we can get a BUG_ON.
> >   kernel BUG at fs/f2fs/segment.c:3589!
> >   Call Trace:
> >    do_write_page+0x78/0x390 [f2fs]
> >    f2fs_outplace_write_data+0x62/0xb0 [f2fs]
> >    f2fs_do_write_data_page+0x275/0x740 [f2fs]
> >    f2fs_write_single_data_page+0x1dc/0x8f0 [f2fs]
> >    f2fs_write_multi_pages+0x1e5/0xae0 [f2fs]
> >    f2fs_write_cache_pages+0xab1/0xc60 [f2fs]
> >    f2fs_write_data_pages+0x2d8/0x330 [f2fs]
> >    do_writepages+0xcf/0x270
> >    __writeback_single_inode+0x44/0x350
> >    writeback_sb_inodes+0x242/0x530
> >    __writeback_inodes_wb+0x54/0xf0
> >    wb_writeback+0x192/0x310
> >    wb_workfn+0x30d/0x400
> > 
> > The reason is we gave CURSEG_ALL_DATA_ATGC to COMPR_ADDR where the
> > page was set the gcing flag by set_cluster_dirty().
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 4961acdd65c9 ("f2fs: fix to tag gcing flag on page during block migration")
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

Hi Jaegeuk,

I've been running my personal Pixel 8a device with this change for the past
3 days and haven't hit any kernal panics since applying it. Feel free to
include:

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
