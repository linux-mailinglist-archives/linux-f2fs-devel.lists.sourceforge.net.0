Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AEB9BCE1C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 14:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8JmB-00036j-Iy;
	Tue, 05 Nov 2024 13:39:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1t8JmA-00036d-FX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 13:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYeCLSsUZRIrmEOMwxGqSfD7V2RsNkns3qvfU6C43UA=; b=AP+w99ZucFfiZSvTaPw8bKTjqG
 c3eDvWeYTA++p8Wxp/cfIH9H/nAIe58aEwz84sumqmr3fMDkcKBqKjvdFaw9m/m6gDGHTQYRY0ZJZ
 7mzp5judvGfXTzBGjPM4AHnrwUQc9PsVw+v1M5Dfsln54nScwDWVxCv1sXXJMVpAr8vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KYeCLSsUZRIrmEOMwxGqSfD7V2RsNkns3qvfU6C43UA=; b=fke7NaXfmQzA0HerMjD3PH2Ziz
 N3iTzRNpHV0nxiP9xZoAVuFBNneyzIImDFE9lOWwO1aJmqubF4iHK08Fta9X5hFaGcTnoe+eMlcfa
 CuC4NyFcazC8Skl4U8s9AhqPIojt5cIHDVfxcZwMCFtEy6g9Bm30dl52oFxQ3JyKb1Q8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8Jm7-0007DG-Tg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 13:39:17 +0000
Received: from macsyma.thunk.org (guestnat-104-133-0-100.corp.google.com
 [104.133.0.100] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4A5Dccb4012098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 5 Nov 2024 08:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1730813921; bh=KYeCLSsUZRIrmEOMwxGqSfD7V2RsNkns3qvfU6C43UA=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=n0sXTzpicMGl6JI0ADkVc/HiKPojEgkGYyO1pQx2dzcrnqvXsM2RZzo+Sb5svGPgc
 qW0SX7zl5zqRkKltYfBmUgFXDCqUkRisSud/xR5J6Tbouah7IfPO5+X+s+0mFZ/id0
 KJJ0kAX4lfNE8lrvU3EBvRFI9YhbvsP4WOsZDJiCLfWkjotYwy29Ajn/HIKkTf9yE5
 NEeFKTWS8cZ06m1TRDAbI0VH51oFtGnGm3lMEoaaiG94ccor1fss0Fcwy+3maWrH6L
 KfqzubfM08EeL0DYjOq/Yn2j7aagvnHNL3UgvZEC8cQqhZOWSOz17Mgc3iRw2QINym
 fJUtJFR76A04Q==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 7ED14340E22; Sat, 02 Nov 2024 15:26:35 -0700 (PDT)
Date: Sat, 2 Nov 2024 15:26:35 -0700
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20241102222635.GB455688@mit.edu>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025191454.72616-16-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 25, 2024 at 12:14:51PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Now that the crc32c() library
 function directly takes advantage of > architecture-specific [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t8Jm7-0007DG-Tg
Subject: Re: [f2fs-dev] [PATCH v2 15/18] ext4: switch to using the crc32c
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

On Fri, Oct 25, 2024 at 12:14:51PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
