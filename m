Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 995429BBA07
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 17:18:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7zmL-0001tv-Ty;
	Mon, 04 Nov 2024 16:18:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1t7zmJ-0001tp-UG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 16:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MfBLldae6HpVT/J0uH6IxgYAl1BDd58WeCFp8bpuhVM=; b=V6GBMcmpqM4pqNTwvNyWprxoTG
 rzMGk53GCEJo+HqYCmi8SStdED24iDyqBGqmsYyFu8enfTRRhney1gPSrjghsBmE6v2IdlPW0dNIb
 +JY2MNBlrJCcOqoXgafsBdj0Eht0mWK+ROXYPxcjZmo0r4o5ZUW/MZOTozYs3lTLd/Vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MfBLldae6HpVT/J0uH6IxgYAl1BDd58WeCFp8bpuhVM=; b=DijQgf79c+XtBOFGDosPulj8ci
 0vF20tRm4mZ4tP5vMZ03nLxgpTLUPQ8UKIiQMzbbUelOAlzCdQE8fmd0WX7T/1sAyi18/EOBw96p4
 pXKr4yVlDk1FyLvb8V52sA2TTQsdH0aHehOVVBx2CqwG85Gvhh7ldZxVv8EBH6Q1Lct4=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7zmI-0004t8-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 16:18:07 +0000
Received: from cwcc.thunk.org (pool-173-48-115-131.bstnma.fios.verizon.net
 [173.48.115.131]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4A4GHDZq005094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Nov 2024 11:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1730737037; bh=MfBLldae6HpVT/J0uH6IxgYAl1BDd58WeCFp8bpuhVM=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=B0Gfw9hby54Mawf3nVtoZfShOFAGukbl6ZTbcBRlBYtaOGsQCDtF0qrCRjYcyueMN
 kV3YMqvlfKnXp0p4fCWynaSg163bApSkqyhJqyYAnlJGmGsBqD0LP+xC7Ub8B3AkMW
 fCaW+bTFL4V+NDN7Mwtj3eK4pBVhp1exceawLgFrmz6mC17UMOrLmM35q5gxC4WiPa
 dU/am5SfTEXUCGkYocIUCIDjggZimNzSIcTYzrac8AXMHympLwlrhdp6OGCVFYpanm
 7zZxGz70mRgKnWKu+qePBhSgO7AcPnfmUhE92pXrgqBwyRWdRGP2hoQHMO6YFDD2gt
 W9K47pAC0MkrA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 8C6D915C02FA; Mon, 04 Nov 2024 11:17:13 -0500 (EST)
Date: Mon, 4 Nov 2024 11:17:13 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20241104161713.GA43869@mit.edu>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103223154.136127-16-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 03, 2024 at 02:31:51PM -0800, Eric Biggers wrote:
 > Now that the crc32c() library function directly takes advantage of >
 architecture-specific
 optimizations, it is unnecessary to go throug [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [18.9.28.11 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [18.9.28.11 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t7zmI-0004t8-F1
Subject: Re: [f2fs-dev] [PATCH v3 15/18] ext4: switch to using the crc32c
 library
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 03, 2024 at 02:31:51PM -0800, Eric Biggers wrote:
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Theodore Ts'o <tytso@mit.edu>

Thanks for the cleanup!



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
