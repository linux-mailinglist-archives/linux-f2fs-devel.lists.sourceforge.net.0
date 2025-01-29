Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28891A2210D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 16:58:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tdASO-0005Ml-7D;
	Wed, 29 Jan 2025 15:58:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1tdASL-0005Md-8Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 15:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tjfdSmbQZktN5AnxF530CGf5ncUa+GaO91f0NTTVYT8=; b=KVda09fnSvRu/huwgRT+qxDByk
 44/YU0YMvWGqv00vO4QT+T3mrTkPrBUtBD1xIp+jgCv9UtJM1jc2utJKMCQ5AhE0c8DAiftBuCKhT
 9fnhvi8dA0ZWK5rA8m990AAHojZjJ4D63geswqmu/oNrEKH+orCJHif+TBiF+IpqBNOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tjfdSmbQZktN5AnxF530CGf5ncUa+GaO91f0NTTVYT8=; b=BaqaMgVsG8gBtoY/EJkZyGeJ9r
 YvwxI+GUu8LeICsyOeUIKPGnuC7eMPt1Jpt0J4+3sKPeug+EoENjoHdGPx6lxvw6Y5cME5nbLdWgm
 WK70gEYZUGAHzUrbrUhzu3iXfijrkAr/In3GsTfpR9Ud/MGLUiac3ZSofOGQVRDgOqj0=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdASK-00089W-J5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 15:58:21 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B9E3E403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1738166294; bh=tjfdSmbQZktN5AnxF530CGf5ncUa+GaO91f0NTTVYT8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EUvyeNefOLOVUnMaofBK1H3VrSTLnaSlL87jx7p1D8vCpTe//kPARa/vTp8vnI9eh
 ZcG53tpMFiswUuYASOHls3F6Vg5XW9ch6xNSsazTupEasEYPFW2nOxt8Ri1SOg0qfC
 cSwBXy7FWpxJvTRK+yKEISaHvGCbkKNyRXvpdUVR/Rpkf6uDT7Io/vRbNDEnkIiO4D
 PV60yuvuSfVyxJctDKDNc+e/lbPZncho4w6bcVdj29uUH8jLc9KZnRB9LTDvIw7oe2
 mxBi4mFGEzdiqrwARkBYV5Gts0IDzSHT0Em/bRXG67PywB1R9Lrhr6sg6omcQPSl2O
 ryOWxxYoG1cWw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B9E3E403FA;
 Wed, 29 Jan 2025 15:58:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
In-Reply-To: <20250129164157.3c7c072d@foz.lan>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <87h65i7e87.fsf@trenco.lwn.net> <20250129164157.3c7c072d@foz.lan>
Date: Wed, 29 Jan 2025 08:58:13 -0700
Message-ID: <87a5b96296.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
 > So, I'm proposing to change the minimal requirements to: > - Sphinx 3.4.3;
 > - Python 3.9 > > By setting Sphinx minimal version to 3.4.3, we can get
 rid of all > Sphinx backward-compatible code. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tdASK-00089W-J5
Subject: Re: [f2fs-dev] [RFC v2 00/38] Improve ABI documentation generation
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
Cc: linux-usb@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-pm@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-hardening@vger.kernel.org,
 workflows@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> So, I'm proposing to change the minimal requirements to:
> 	- Sphinx 3.4.3;
> 	- Python 3.9
>
> By setting Sphinx minimal version to 3.4.3, we can get rid of all
> Sphinx backward-compatible code.

That's certainly a nice thought.

With regard to Python ... are all reasonable distributions at 3.9 at
least?  CentOS 9 seems to be there, and Debian beyond it.  So probably
that is a reasonable floor to set?

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
