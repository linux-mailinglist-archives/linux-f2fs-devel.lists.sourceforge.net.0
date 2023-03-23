Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 400406C6B88
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 15:50:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfMGm-0007a1-2Q;
	Thu, 23 Mar 2023 14:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1pfMGk-0007Zl-IK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7azV9DBDgQBiJKia4YDLFtE+brQJDyiEHzkKR+zggZo=; b=aUVvBWxndu+dTUVEaYsKmutoHj
 G1dCir38zQrof/lnjdBBwBe2Ng32GTtNfx1Y6C0mJJwednVed/5Q3ZOP7SRpiiXm8CbF+isTdGjv/
 zKnEGXRecg7uU6KlyDO3DZLLeXRCiAf9qyzSRxcKg5Dp3xiCxdXZID5soLIaZuZRaaFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7azV9DBDgQBiJKia4YDLFtE+brQJDyiEHzkKR+zggZo=; b=Zy4ZpYlP1SvOb31IJoFq1Cz3Am
 PAW422sdRpAnt+/v63ZucguiNuf1yU1BjfyLt/k+AV8PSl6O7Vqnfp0oTg0w4PicVgklxGEPboHlt
 YjNKg3/h7XlzJBIP3NG2qy/ez8FJ+Ba5negqWpeVLfUrMXUWnDJSj7+lyR+cDJynI3OQ=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfMGl-000JJN-N0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:50:24 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 32NEdpYe013894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 10:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1679582393; bh=7azV9DBDgQBiJKia4YDLFtE+brQJDyiEHzkKR+zggZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=C1rcV08pIURUpZuCG31evHvrrmFZ0e/hKAgfKKHzRyqWYdrjeS8psJc7VXmM83Ww3
 H+qn70JDFZ5LE/MgvbBQIcvN5frghysghTu5KegOU0Su2l1TG21SF0ALzXK8WbY8AY
 MikMCbM2Y1XJsiPTzYqJuzceXZFyvPyQgJAgeFcy/Yi1rQBUWoEwhgBgJ2h6BXe+lZ
 lTUAaLXwEIZCFnXzT5udcoWRFQplckWtHHv1RpyfmznjS5vnhsifY9ndKHrWlPtXfo
 Ht0Q0EXjvbNo7ziCYIjBSW8DOZZE5qusUU59xCZOOCudUwucxg/e7wEFLJ2ycJ18h+
 ucyhGIXNXCYCQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id BC71515C4279; Thu, 23 Mar 2023 10:39:51 -0400 (EDT)
Date: Thu, 23 Mar 2023 10:39:51 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20230323143951.GH136146@mit.edu>
References: <20220622194603.102655-1-krisman@collabora.com>
 <20220622194603.102655-7-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622194603.102655-7-krisman@collabora.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 22, 2022 at 03:46:02PM -0400, Gabriel Krisman
 Bertazi wrote: > Instead of invalidating negative dentries during
 case-insensitive
 > lookups, mark them as such and let them be added to the d [...] 
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
X-Headers-End: 1pfMGl-000JJN-N0
Subject: Re: [f2fs-dev] [PATCH 6/7] ext4: Enable negative dentries on
 case-insensitive lookup
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

On Wed, Jun 22, 2022 at 03:46:02PM -0400, Gabriel Krisman Bertazi wrote:
> Instead of invalidating negative dentries during case-insensitive
> lookups, mark them as such and let them be added to the dcache.
> d_ci_revalidate is able to properly filter them out if necessary based
> on the dentry casefold flag.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
