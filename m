Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08239767C30
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jul 2023 06:52:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPbvy-0003OL-Nv;
	Sat, 29 Jul 2023 04:52:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qPbvx-0003OE-6k
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=82uhWJod7lIIaCNsKBPhvP9wNUVbXByQvSeS4aiYBoI=; b=DtLDWCVgbZ7eh89l0A1Y4SeZnX
 RJwxjJ8As8J36D5jfA20BOxyak+XTtUTzJbZgxu4+jH9cidrJvxSErU3ZN64UfQmvjEiti5Ttxg2E
 q8ABSQI2am7y48hJ4Ud4W4S7VpzyHPXr2GLxw6Uc0gqU4UOHUV1bPxw2jhct4oMZhWRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=82uhWJod7lIIaCNsKBPhvP9wNUVbXByQvSeS4aiYBoI=; b=cQo8dDhAWlzbCTFeEt5QsQC0uE
 XNCkf8D3YHD+4vq1TVkz9WVel2Xguhw3/XmquRSPkKj3z3ccakEcgXSiQJ0qldd7gW/oe0OxkBNFC
 X+BoXOcfHaDdXVof1yM9mhU0U0QBVmGpywAGUtyADetz3OR1/yeDj5m1Mn9Exh5sZeeA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPbvw-0006Fb-KT for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:52:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 107066009E;
 Sat, 29 Jul 2023 04:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0C6C433C8;
 Sat, 29 Jul 2023 04:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690606318;
 bh=8CzHdaD4e57PvnCBD6zGsTCAxTvP8AnAGmWTWStQ05A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QUfHkctW5jrZ5oRfrm5BWOp99D4FhHHJ5FF3U/Cbwi6M4KINBV3OH7k0lEXiOAbqj
 m8cwbnIxa2hG76i7cjAIz8CZ3geskfUggZe46CY26qAzaeV8Z0B/W5Eh7XM6Zk4VU1
 eScItR55iQTiAaWHlabzrprU9mRIiYxuRahKKeFas7Qjd5I+mHo54kqhBf9q/MMrTK
 9zObyTz4OdaE9cV+3PJodwm8B0NBmSwonvQBpQ2NtiIoT1X5i45ALO70/yBFADPTGU
 Bk9QpnUEfSUi1vCVUswBy27hPgr+GocgZopvqRxB1O1JUbOHdLboxZ/PtMjKtcu8Jm
 qfC00n8oCyaYg==
Date: Fri, 28 Jul 2023 21:51:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230729045156.GD4171@sol.localdomain>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727172843.20542-4-krisman@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman
 Bertazi wrote: > dentry->d_name is only checked by the case-insensitive
 d_revalidate
 hook > in the LOOKUP_CREATE/LOOKUP_RENAME_TARGET case sin [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPbvw-0006Fb-KT
Subject: Re: [f2fs-dev] [PATCH v4 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
> dentry->d_name is only checked by the case-insensitive d_revalidate hook
> in the LOOKUP_CREATE/LOOKUP_RENAME_TARGET case since, for these cases,
> d_revalidate is always called with the parent inode read-locked, and
> therefore the name cannot change from under us.

"at least read-locked"?  Or do you actually mean write-locked?

> +static inline int generic_ci_d_revalidate(struct dentry *dentry,
> +					  const struct qstr *name,
> +					  unsigned int flags)

No need for inline here.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
