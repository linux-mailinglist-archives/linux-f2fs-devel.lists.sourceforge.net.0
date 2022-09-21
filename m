Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7922F5E542F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Sep 2022 22:07:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ob60K-0003uX-NM;
	Wed, 21 Sep 2022 20:07:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1ob60I-0003uR-Ty
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 20:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4+6lLfNCXT495Y/8Kd50pp68aEH52Y+mpgUuGAhbZbs=; b=iUkEAS1UYuSfLymA4pbESmDnTr
 TQWpgz5/uo5H2UCDU5Ku9bdslIa/pUyt3nz2/SKZWg2Wn8WSvKM4aoElNBZHvuQa81pghR6gQvDOb
 YTPLozw+GrStrgLEVqOradK4rHukVngVIDCxW9PbIq1Ds7zdhLCVsdGLl9QlfBATSJ+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4+6lLfNCXT495Y/8Kd50pp68aEH52Y+mpgUuGAhbZbs=; b=l7Q5MtNoMMIo17tzPwmzaY7mWz
 1nEo9lf4x3tDspRCCoiLoHYIVTauE3fqYxnLLSxUeasfiLIOiQDIiJwvWtd714nsDWKdfVbDng06d
 kt+w0MVGZBdlTAtge2frTH4aicQdmG9EwrlFUj5nu9l+QFQNG+z5ZZCbw+PANb790AHw=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ob60U-000855-08 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 20:07:43 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id CECD2735;
 Wed, 21 Sep 2022 20:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CECD2735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1663790851; bh=4+6lLfNCXT495Y/8Kd50pp68aEH52Y+mpgUuGAhbZbs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=tBWPjq8gDizNGC+FQz5gR2OZ8SPy85+3KuW7lt8zPLkyWF9q39cBIFdshsbsR++cM
 7TBgNGA4e5+8YLlcpCyhv+vhG3Scfgk+JTee8QABjHsHxprQs3ZxItvTGCtrRon5iZ
 AfoQVHL1nuzlDJzE5HhQUnODQg7QVcMhZzebZJafuZ4bD4dUbk5kyCL+T0mo8f1PIC
 iJNd2CHh6Ulln/fZK3A062hAuFveWqeUf8BMpcH9iAgpQuTshzWa5CDdv+oJogLhcS
 4fl03NUBJaZRtZ1qY1asrzTFKG2cfH17lTahtj1tCD37zQwnc5SniMdGQ+45m55hDv
 KOCEcbVFMk1Sw==
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
In-Reply-To: <20220901002828.25102-1-rdunlap@infradead.org>
References: <20220901002828.25102-1-rdunlap@infradead.org>
Date: Wed, 21 Sep 2022 14:07:30 -0600
Message-ID: <87leqcv6d9.fsf@meer.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Randy Dunlap <rdunlap@infradead.org> writes: > Change
 occurrences
 of "it's" that are possessive to "its" > so that they don't read as "it is".
 > > For f2fs.rst, reword one description for better clarity. > > Signed-off-by:
 Randy Dunlap <rdunlap@ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lwn.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ob60U-000855-08
Subject: Re: [f2fs-dev] [PATCH v2] Documentation: filesystems: correct
 possessive "its"
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
Cc: Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Seth Forshee <sforshee@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Randy Dunlap <rdunlap@infradead.org> writes:

> Change occurrences of "it's" that are possessive to "its"
> so that they don't read as "it is".
>
> For f2fs.rst, reword one description for better clarity.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-xfs@vger.kernel.org
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Seth Forshee <sforshee@kernel.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Reviewed-by: "Christian Brauner (Microsoft)" <brauner@kernel.org>
> ---
> v2: Reword the compress_log_size description.
>     Rebase (the xfs file changed).
>     Add Reviewed-by: tags.
>
> Thanks for Al and Ted for suggesting rewording the f2fs.rst description.
>
>  Documentation/filesystems/f2fs.rst                       |    5 ++---
>  Documentation/filesystems/idmappings.rst                 |    2 +-
>  Documentation/filesystems/qnx6.rst                       |    2 +-
>  Documentation/filesystems/xfs-delayed-logging-design.rst |    6 +++---
>  4 files changed, 7 insertions(+), 8 deletions(-)

Applied, thanks.  Sorry for the delay ... conferences ...

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
