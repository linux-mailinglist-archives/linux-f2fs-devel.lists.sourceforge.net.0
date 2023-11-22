Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE757F5203
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Nov 2023 22:04:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5uOZ-0003xD-DV;
	Wed, 22 Nov 2023 21:04:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r5uOX-0003x7-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 21:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Humg2PScZF2wDwV9BWUbbU67w2PP4g8zlkqlYFN20Ks=; b=O+hCreh5UnMcVfNhPeGGR4PdDS
 alXF3T+Vq8WtFQkN/KukGb0Utx2u43cW4a81mjPiQK/QQUCfieYEoHUlVes1FNPzYYV4TQMkyTzNq
 lIF5ruLQ6ZI1UGtLoptKPHA35Pyii2OeJT+A6/J6XcaekPsIexk9BRiEp7XRF0fdDnqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Humg2PScZF2wDwV9BWUbbU67w2PP4g8zlkqlYFN20Ks=; b=Fsft5M6+WbL3qDTRE7/H0VPn87
 jDAlaCJos3YjOTAt3n7AqF2tAQlfyReuwIidwu+BsRDmU2CNVyfE+1liIJ1rtjMTc71VwQlgI52gT
 OMI2LbuMex7+BMCvz/u9GcvJjgI3slqUqd7+H7YZdZqO4Dv8CPGPHOaoWMCvu+YI/Xsk=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5uOX-0000Jd-B7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 21:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Humg2PScZF2wDwV9BWUbbU67w2PP4g8zlkqlYFN20Ks=; b=saaCeffvvvXFQAMl5XrkZp/Ir1
 Qr5jS0Tl4PHDBDPU4+Kz8cC/AERvEe8TE6+lgVynBikt+bjlljWmV2aHZkgpXMl51l3ZeEdBCeoS4
 npSbxVDnboFB96eVhbUnTt475sGMob1LX0IKSskTyQmZHKCcoXx6KvPQVcFxnGpDi1GaxZotgWosS
 35JZzWQ0bVIDIvQwfLnQCGLU6qe8dq4u/6eUasj8sID2+n9O3rsgtH0Te9sshmx9pRuoLN+B7hXR9
 A93hFlEWg10arO2Yft3zS7I6nhLcMLKq/u5mBMX8JYm8gxiJPS/ZUMzhn6lO+Dws9G05ZwQizar64
 LARp+q3Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r5uOM-001mcA-1y; Wed, 22 Nov 2023 21:04:14 +0000
Date: Wed, 22 Nov 2023 21:04:14 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20231122210414.GI38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121020254.GB291888@mit.edu>
 <CAHk-=whb80quGmmgVcsq51cXw9dQ9EfNMi9otL9eh34jVZaD2g@mail.gmail.com>
 <CAHk-=wh+o0Zkzn=mtF6nB1b-EEcod-y4+ZWtAe7=Mi1v7RjUpg@mail.gmail.com>
 <20231121051215.GA335601@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121051215.GA335601@mit.edu>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 21, 2023 at 12:12:15AM -0500,
 Theodore Ts'o wrote:
 > Yeah, agreed, that would be a nice optimization. However,
 in the > unfortunate
 case where (a) it's non-ASCII, and (b) the input string [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5uOX-0000Jd-B7
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 21, 2023 at 12:12:15AM -0500, Theodore Ts'o wrote:
> Yeah, agreed, that would be a nice optimization.  However, in the
> unfortunate case where (a) it's non-ASCII, and (b) the input string is
> non-normalized and/or differs in case, we end up scanning some portion
> of the two strings twice; once doing the strcmp, and once doing the
> Unicode slow path.

The first pass is cheap and the second one will be running entirely
from the cache, so I doubt that scanning them twice will be a loss...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
