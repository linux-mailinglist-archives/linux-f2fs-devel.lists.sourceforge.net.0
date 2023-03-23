Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA26C6B6A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 15:46:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfMCV-0000sW-7k;
	Thu, 23 Mar 2023 14:45:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1pfMCT-0000sP-TK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFMJqLcjrnAL8JljGxhBhN4umzSGhKk2guyVXCBOPcw=; b=m/fdd/aBmKrNNghowzg9+ppMh2
 W13IDNMP56dujGX6+AJKb/fe+KdHndn0JHMDYzLOziXvq05M9zTN0EFzMSguujYEyv32iZvTLiIFw
 0WaBLMgM4iwYR7+0tLAdy1mde4p+J83tZ3qan1eCxXrEGIpU9gFv2CRXkel2y5vP1ZJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFMJqLcjrnAL8JljGxhBhN4umzSGhKk2guyVXCBOPcw=; b=l8R+C0xwgGgojTo96nvLVck5Lq
 GiIp6R8+LEWluNoSgfWOjOvUDhhA1Bbgmut9upIVahQdGQiRgXAvk4I7tROVly5ylMtFwLoTR7H95
 wb/v6prBaA1pEB0aYYCTeM01hxw0tE98COwVp5TdGSqvzJAu/9ogdsrhpPRElxQYaK7o=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfMCQ-0005gh-BY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:45:58 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 32NEbYI4012741
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 10:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1679582256; bh=mFMJqLcjrnAL8JljGxhBhN4umzSGhKk2guyVXCBOPcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=QU753MeneCiMKiUaxD2SVGtaiTPUast8Iy+eVbGI/zd7Xn7/UyBda8Q9N1+XDIqKK
 1TlpuOc0h2DttAII4hn/Tf+/mOFTyq51cT3CtOgLt4qqyxJIbsdHGDI15cFPabPCcV
 YtfscSmSgI8ZKxgKNx38VZYX0NO6/4ecDtphjOxOZPn/3lJBWu2Nhn/QsfS20A/MA0
 scOkceHzQBQ9Do1rsLBMItUlmwBHCgJKwMfqnEAD6z4yP2CODTkAtZSWOw8JEcoN2I
 xboNsLpu3jw7f7t6vsS69p20vliCL9y+nDvFsDdPYLEe2X/x3hlTC8BHabhvK1Rxuu
 UmRWma7CYmSKQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id A11F915C4279; Thu, 23 Mar 2023 10:37:34 -0400 (EDT)
Date: Thu, 23 Mar 2023 10:37:34 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20230323143734.GF136146@mit.edu>
References: <20220622194603.102655-1-krisman@collabora.com>
 <20220622194603.102655-5-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622194603.102655-5-krisman@collabora.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 22, 2022 at 03:46:00PM -0400, Gabriel Krisman
 Bertazi wrote: > Preserve the existing behavior for encrypted directories,
 by rejecting > negative dentries of encrypted+casefolded directorie [...]
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1pfMCQ-0005gh-BY
Subject: Re: [f2fs-dev] [PATCH 4/7] libfs: Support revalidation of encrypted
 case-insensitive dentries
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 22, 2022 at 03:46:00PM -0400, Gabriel Krisman Bertazi wrote:
> Preserve the existing behavior for encrypted directories, by rejecting
> negative dentries of encrypted+casefolded directories.  This allows
> generic_ci_d_revalidate to be used by filesystems with both features
> enabled, as long as the directory is either casefolded or encrypted, but
> not both at the same time.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
