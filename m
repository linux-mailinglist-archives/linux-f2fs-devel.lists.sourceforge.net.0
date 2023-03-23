Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96B6C6B8D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 15:50:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfMGq-0007au-1E;
	Thu, 23 Mar 2023 14:50:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1pfMGm-0007aA-Bn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n243UkKU1dhQVd7DjzyG88PTzABaz+ZslvR4BBb7qqM=; b=XF30qVOVNc3UWYUla6unBF+za8
 RutlbjkFfLd+jMAvjmW1LKZnjStMJLSSzBCpP3Ow02hA6YES5j1aDWz5cToj2Rm7B6+AOB1t48WG0
 Rwo+FB+5//wdMBbOe3MB/G2XOJrSuZHf4SqOGUU2/SmSrB/pDLISmEB+gb3PAHk5WLig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n243UkKU1dhQVd7DjzyG88PTzABaz+ZslvR4BBb7qqM=; b=BjsEoDdWIYtf5+YQ8a76XF/BZL
 AEOfkTa0AU+onAZJZ7tolkA77qAbNOVVajDAr5aXvDOXCHm7Mw02zoWYgtYZ3GdwgoTcn5hXgUR/b
 NlNQSucpDMRtvSaHvBOCKkXoNtZSbuKf5KtRdsfVT6JcjQGUpItUNGOVRuPo4xo1w4bM=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfMGn-000JJN-NE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:50:26 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 32NEXKRh010278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 10:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1679582002; bh=n243UkKU1dhQVd7DjzyG88PTzABaz+ZslvR4BBb7qqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=C3A0S93pvXptCixS1bEn3ZWm9blHoINL7rmJpXmQ1AI7LQGCBhlTVKfMLttc30AIn
 /mAkwxzcSQSI0LfDGTdodwzmQDF1WfDq5nhLyLR5dJSq62jIUF561n3LmfRrhkeXD0
 jaAKzhThfspyr6g9LbQrIK3tRaZGgeUwWayayD0c30L31WXijUnIdOosyubFeRQUE6
 Qfph8eAvQVenwT9qIjh04pXV6mIe9Z3kC+ADrsy/sCzGeRJRn7cb5xxItr4H428WNj
 0vflOAGwsHWvpz0tyfzrhIEfOInbeCSQVJ0tSCX6vFHxeYGYKD85IbOHpNEBve3wDB
 LUASlnZ/kqEXg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 5669715C4279; Thu, 23 Mar 2023 10:33:20 -0400 (EDT)
Date: Thu, 23 Mar 2023 10:33:20 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20230323143320.GC136146@mit.edu>
References: <20220622194603.102655-1-krisman@collabora.com>
 <20220622194603.102655-2-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622194603.102655-2-krisman@collabora.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 22, 2022 at 03:45:57PM -0400, Gabriel Krisman
 Bertazi wrote: > Negative dentries support on case-insensitive ext4/f2fs will
 require > access to the name under lookup to ensure it matches t [...] 
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
X-Headers-End: 1pfMGn-000JJN-NE
Subject: Re: [f2fs-dev] [PATCH 1/7] fs: Expose name under lookup to
 d_revalidate hook
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

On Wed, Jun 22, 2022 at 03:45:57PM -0400, Gabriel Krisman Bertazi wrote:
> Negative dentries support on case-insensitive ext4/f2fs will require
> access to the name under lookup to ensure it matches the dentry.  This
> adds an optional new flavor of cached dentry revalidation hook to expose
> this extra parameter.
> 
> I'm fine with extending d_revalidate instead of adding a new hook, if
> it is considered cleaner and the approach is accepted.  I wrote a new
> hook to simplify reviewing.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


Al, could you take a look and see if you have any objections?

Also, any thoughts about adding the new d_revalidate_name() callback
as opposed to change d_revalidate() to add an extra parameter?  It
looks like there are some 33 d_revalidate callbacks, from 24 file
sysetms, that would have to be changed.

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
