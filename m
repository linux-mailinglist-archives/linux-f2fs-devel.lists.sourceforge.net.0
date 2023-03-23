Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6505F6C6B8A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 15:50:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfMGq-0000yG-H8;
	Thu, 23 Mar 2023 14:50:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1pfMGm-0000y7-Qj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WS3FA5IPygO1Ck5mQ+QTJf1mkRjXBenZoIXY/rh5uAU=; b=irML5WtFLB3oWSm1oUD6PJw3+6
 ndEb8R4m0NM/jXO12E2xUqQ0ugw8Asag+3l0F1+fPK/s3VBU/HNmnRkkHOsGunLfpjb11RxKhyvFl
 GJqjff8eE3iDA9dnBKO9m+jrgsIHjYEc0plq7lRk9tYdaVNG/tC3WDFPnrJ76AodZ/dU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WS3FA5IPygO1Ck5mQ+QTJf1mkRjXBenZoIXY/rh5uAU=; b=GBYxuIb7ot0juoBpFdLbnS4ZMf
 3L+eVaMWI0clREAR+OCxuWFF8YWe7AgrSLNzrfBXdOvZnV9IW2BZYHR5xM7E0Jc2YIZ5SrNonAaWR
 ddoDr5x614AuGqvf4aEjz7wcY2vbZwOAFha9BBx+Nol9dxzEG0F7ORnwKQhzzRrGEj/c=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfMGm-000JJN-Pj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:50:25 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 32NEXYCp010405
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 10:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1679582016; bh=WS3FA5IPygO1Ck5mQ+QTJf1mkRjXBenZoIXY/rh5uAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=DjzVGLEijlnDAru3dwaNpS7M5xs/XCf36tb5u7BX3g8Rlrr6PfZvPExugaCgF5Bwg
 ymGsb7WyAUa4y9GLbC0PQHh4/eqUVMCs595PR9AUfYbq5w4kyGZMxIETTCkz2nSvYg
 2xHWkIpkW4I3SpSmNR+c3HCs43ew1iALw63NjLuz9xgzlUUq0wpmWAp5GjO7+8zzVd
 YKneBxewl/o6UlzM7MieSOy/wAGeTRjINKvGdDXfHcFDhyftFF/qynk3DI9WM0Pc4L
 /+OGNiGePJv+kgGFill5UzCe08UAKgreIQghlrF5KjuAn45hn6vIIQHiITh0bN7Img
 T1BK8yf4TmDZw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id BE7A115C4279; Thu, 23 Mar 2023 10:33:34 -0400 (EDT)
Date: Thu, 23 Mar 2023 10:33:34 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20230323143334.GD136146@mit.edu>
References: <20220622194603.102655-1-krisman@collabora.com>
 <20220622194603.102655-3-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622194603.102655-3-krisman@collabora.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 22, 2022 at 03:45:58PM -0400, Gabriel Krisman
 Bertazi wrote: > This flag marks a negative or positive dentry as being
 created
 after a > case-insensitive lookup operation. It is useful to d [...] 
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
X-Headers-End: 1pfMGm-000JJN-Pj
Subject: Re: [f2fs-dev] [PATCH 2/7] fs: Add DCACHE_CASEFOLD_LOOKUP flag
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

On Wed, Jun 22, 2022 at 03:45:58PM -0400, Gabriel Krisman Bertazi wrote:
> This flag marks a negative or positive dentry as being created after a
> case-insensitive lookup operation.  It is useful to differentiate
> dentries this way to detect whether the negative dentry can be trusted
> during a case-insensitive lookup.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
