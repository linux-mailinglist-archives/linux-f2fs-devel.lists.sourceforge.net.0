Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1210765B3A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 20:14:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qP5Uu-00007D-Gl;
	Thu, 27 Jul 2023 18:14:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1qP5Us-00006q-Hz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 18:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YhV95XsKE5ygKImXHE1eq93G7xXd76r7xSZbt1Eo2yM=; b=IX/qDZ4/kWT6yHQi/bQi/YF7D4
 4QQT6Zchv6hLU1FHUeOv2oY3k+lSRuBrzWVcRO3NO8EB4qQSHBg1PZrOFfeQjShCMGN2BzLKmyVGs
 kT9Nqtb5rwskf/Iq1DPhz9goaATXh35cYa2JIhlQIKDkvoncRlpVYB/qDO7YBe02iA9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YhV95XsKE5ygKImXHE1eq93G7xXd76r7xSZbt1Eo2yM=; b=CWpaLASBVsKQI5p/gwgGELVVIk
 FFetbka0D+nrT+n5Ks9crMf/cL2MMRKpXP1KMr2sN8+OOXrhc89D591t6mq1x8WCDdNqVEdxKGbEf
 bqHD0zrYujEwLA0hbdKOO3nfuEaMHAQmX8DRh+FBqckCKI9D1btKUF3kD5IX8zSlJxbQ=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qP5Up-0002jb-5S for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 18:13:59 +0000
Received: from cwcc.thunk.org (pool-173-48-115-64.bstnma.fios.verizon.net
 [173.48.115.64]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 36RIDdNJ032404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 14:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1690481621; bh=YhV95XsKE5ygKImXHE1eq93G7xXd76r7xSZbt1Eo2yM=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=Jk0wiFKtbRC5O3WJWjnZ2xh+xyCKHrTjzINuGBBeD8UVxpWB8GV44VbRpWwgLz0qo
 ejRW0dZrPurHOSBaYdlvb0JS1/cwU8SRMjF+jexEYelgK2JklChrQfMebrl044UnRW
 6q2UPLMYTpdTcFMbVAK4NvzHAyB4+sbOOdc4z5U7CWXEpf5w24hu5ziSqNy24pBphd
 mB2nr87xwE3PHYrVxZKzv0GIoJ86UlTyBu69wdfMBiSsGBgdeKDf7ydGLPtAM9Sxw4
 ilCU/kBrrs5nqJ+acgWcdOOF17qi7JfXWlGTOEpVJ0aHmFwy/b5ghndVr6hHp8pfbg
 jDoMewJBrFQMQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 30B1A15C04EF; Thu, 27 Jul 2023 14:13:39 -0400 (EDT)
Date: Thu, 27 Jul 2023 14:13:39 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230727181339.GH30264@mit.edu>
References: <20230727172843.20542-1-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727172843.20542-1-krisman@suse.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 01:28:36PM -0400, Gabriel Krisman
 Bertazi wrote: > This is the v4 of the negative dentry support on
 case-insensitive
 > directories. It doesn't have any functional changes from [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qP5Up-0002jb-5S
Subject: Re: [f2fs-dev] [PATCH v4 0/7] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 01:28:36PM -0400, Gabriel Krisman Bertazi wrote:
> This is the v4 of the negative dentry support on case-insensitive
> directories.  It doesn't have any functional changes from v1. It applies
> Eric's comments to bring the flags check closet together, improve the
> documentation and improve comments in the code.  I also relooked at the
> locks to ensure the inode read lock is indeed enough in the lookup_slow
> path.

Al, Christian, any thoughts or preferences for how we should handle
this patch series?  I'm willing to take it through the ext4 tree, but
since it has vfs, ext4, and f2fs changes (and the bulk of the changes
are in the vfs), perhaps it should go through the vfs tree?

Also, Christian, I notice one of the five VFS patches in the series
has your Reviewed-by tag, but not the others?  Is that because you
haven't had a chance to make a final determination on those patches,
or you have outstanding comments still to be addressed?

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
