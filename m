Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3AE7FFA65
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 19:55:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8mCF-0003aF-As;
	Thu, 30 Nov 2023 18:55:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1r8mC5-0003Zk-Ea
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qQKU50vKbXATuSXglJgEj5fFzmKu+YBO07b8qJOOdtA=; b=fDPid51j5q5wn/Ic19jNTFMi7C
 r6JZaXX1UZJosGluqDNv1HQbtpJijuQtVdYGY9m+oSuUnz7TGKHehJwgPz4HMRZXNf9/vxHHK/Cyi
 KrsjrWtADIvNIilpWUHkRkHRTMn38o7KOLWa5w6PNquujunfmWZ/BshwHMXExcfuO910=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qQKU50vKbXATuSXglJgEj5fFzmKu+YBO07b8qJOOdtA=; b=OSZL1IkxrNJPN3OvfURy4PMGeP
 349lwJWeuKsjUA2o5dElHs/0IaQTK7bwDi3H+UuXQFxif96G9DhfHbw9jgrTsxVnmtaIcD7ux+Q7J
 DgALO2qgn98UWKmN0Z2ZmXiKqb7FxBTHDQSzTbeBHjcnzAJ1BGsfkGYMBlEmT5Rw64zw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8mBs-0007uy-2M for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qQKU50vKbXATuSXglJgEj5fFzmKu+YBO07b8qJOOdtA=; b=a27xugt2s7VCRZavZTnsN7HQZG
 49KGSFnP/lAr4dvK7i3HDJ4RMmY5/nj+Q/JtVwbX2EuSbtBP1TjOeJMiHUf17uTVAJdLo1VZZ8F7w
 f71Vg7/+DA5n6sUIJ030PbPVYq4bFV/2Q2Ch0CQ0wUYSClwjbvJxHySEDNe+p12tTfX4vqeMoQWG/
 RhpFELpiLJn1M+ZCQSbXXoxilSLcvbQDkXyKOLFhzt6YooPUXC46hvY+yy3pK5WjJBP/Ib1g29m8f
 ILI8SIpHjF0/ndrR5p2Q8uZNWd++lBHHKEPQf23MjpSx3hP2l9JhKT9Be1BvgumVRJd2JPK/YsJ32
 OHAR/qMA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1r8lss-00Ek8D-29; Thu, 30 Nov 2023 18:35:34 +0000
Date: Thu, 30 Nov 2023 18:35:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZWjV9obu2mvBfXbk@casper.infradead.org>
References: <20231130090413.1291703-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231130090413.1291703-1-frank.li@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 30, 2023 at 02:04:09AM -0700, Yangtao Li wrote:
 > NFSv4 mandates a change attribute to avoid problems with timestamp >
 granularity, 
 which Linux implements using the i_version counter. This [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r8mBs-0007uy-2M
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support for an i_version counter
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Wenbo Hong <wenbo.hong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 30, 2023 at 02:04:09AM -0700, Yangtao Li wrote:
> NFSv4 mandates a change attribute to avoid problems with timestamp
> granularity, which Linux implements using the i_version counter. This is
> particularly important when the underlying filesystem is fast.
> 
> BTW introduce a new mount option to enable the iversion functionality,
> and disabling it by default.

Why do you want to replicate the mistake made in ext4 and undone by
commit 1ff20307393e ?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
