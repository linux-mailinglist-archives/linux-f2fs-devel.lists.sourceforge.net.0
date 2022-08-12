Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 067D759155C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 20:13:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMZA5-0000Cq-14;
	Fri, 12 Aug 2022 18:13:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oMZA4-0000Ck-98
 for Linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Aug 2022 18:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hY9ldZftYxmWqZHR3OVJ9I5Z9FQ8L4Cn6knD6PbjHm0=; b=Zu0n8sO+0+2AZReiJHwq9ANgmQ
 1O1N6peni/vYTayZFjX2HwcZnk5ozGAHXxfABctIV0yTC0nXmLeQewVhunai5UNb14fj4ErOvACrN
 mfuXvOxfmhQmYb+EcksTgLH0wN7A9GWWuZSbnACUx9fUxe2f0ARQ3Q7dlHStMaRXdscM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hY9ldZftYxmWqZHR3OVJ9I5Z9FQ8L4Cn6knD6PbjHm0=; b=bruJeJPtvMdB7tYA1wK8DUhdDZ
 O8EycfeJJXBJiP+x+xAWGwtsdfJyD42WWwaHKyDwbL7jCWgdGnGpG9JGdvokEne2zta0ikvaDmabq
 cSvOUV0P4kkFCkU6JiRtEiPhWkYhoDyaiuGUG38mg7WpkLKf+kORY+bgUqffEmn9A1H4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMZA0-0001EY-De
 for Linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Aug 2022 18:13:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BB7161730;
 Fri, 12 Aug 2022 18:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60391C433D6;
 Fri, 12 Aug 2022 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660328002;
 bh=CH92FZAaNDvrNlVT3/Tj7SsXWKb0V7Ui4XdD+LfPeLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VD2RcgcDniWsuDPncdqBFDiqEZA782xg97rrfM+Jl6/fcDudzTxBcEMTsj3iZ+puE
 yDEcGmrw6q4W6ayaSZWmBJq73if36dLGd9arecSJN7gjhBM1hp3zoFJ9xUlDLVWuEA
 H68SLT5VbfHZPVCAkrE7xwYSAAMctXe7nKQ2FCoW4Jh6JMt5t9U8b2M3rnpfZnEACm
 iaBvmLf4bnKO5WwqwUx+hdKzm9kynI7O4nhFW+EsKGscd+ap5/S54cAFsL77B5006p
 dp3b7Eh/XI90VBRvUA7Jvk/xMafHIR5hD9qFRjjXKsMISxuUnqKh+df9EkfDJlTIXh
 rBRL6UfqiMcMA==
Date: Fri, 12 Aug 2022 11:13:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: John Kehayias <john.kehayias@protonmail.com>
Message-ID: <YvaYQI4/ZJgOW6sb@google.com>
References: <z1RSWUWvfCmbB3L_utbn1krfKRIw9T0dlzsLmT2h9615ny3oIgP80mJBL-L58og28AYHPIZdcAOBU9Ok7ao00tJUN9KNFM2K_owrSflLUWk=@protonmail.com>
 <FzLKsvvLk49Fv4JSwZzQkszOSWRKa1nO9bzhwRApQHDtjmz-qYPvdMHOA2KQa1sMod4oFZfYHXE-WSokABljrpT_9UY6pD6NzY5rVGAoGLQ=@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FzLKsvvLk49Fv4JSwZzQkszOSWRKa1nO9bzhwRApQHDtjmz-qYPvdMHOA2KQa1sMod4oFZfYHXE-WSokABljrpT_9UY6pD6NzY5rVGAoGLQ=@protonmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/12, John Kehayias via Linux-f2fs-devel wrote: > Hello
 again, > > As this is the main disk for a homeserver, I was anxious to get
 it working again. After reading about what seemed like the same e [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oMZA0-0001EY-De
Subject: Re: [f2fs-dev] How to recover from "Wrong valid_user_blocks"?
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
Cc: "Linux-f2fs-devel@lists.sourceforge.net"
 <Linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/12, John Kehayias via Linux-f2fs-devel wrote:
> Hello again,
> 
> As this is the main disk for a homeserver, I was anxious to get it working again. After reading about what seemed like the same exact problem here: https://old.reddit.com/r/linuxquestions/comments/whomdc/expanded_f2fs_cant_mount/ I thought using a newer f2fs-tools would help (I think I ended up with latest git commit). As I reported earlier though, resize won't do anything (already resized). So I thought about shrinking, though it might be risky.
> 
> First, I tested with a disk image, made with dd and mounted with sudo udisksctl loop-setup -f disk.img. Then I could operate on the loop device with that partition, /dev/loop0p2 in my case. So I tried shrinking, bolstered by the good experiences reported in https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg23214.html Since the size was something like twice the data on it, I didn't worry too much about how much smaller I made it. That was then mountable! So I resized back to the full size, and that still worked. Bonus: working on the disk image was much faster on my SSD than the original memory card.
> 
> I made another fresh image for backup and then repeated these steps on the actual disk (memory card): resize.f2fs to shrink slightly (with -t <some sector amount less than max>) and then resize it fully. Everything worked!
> 
> I have logs of the resizes and fscks happy to share though I know this has been reported and seems fixed in current versions.

Ah, so the recent f2fs-tools addressed your problem, right?

> 
> John
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
