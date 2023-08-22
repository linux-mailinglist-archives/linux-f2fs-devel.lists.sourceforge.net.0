Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C499D783C71
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Aug 2023 11:04:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYNJ0-0003Nx-JR;
	Tue, 22 Aug 2023 09:04:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qYNIz-0003Nq-DY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Aug 2023 09:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XF2DHR9cVBAjSC1JYb0fBkqyDH+OwSrCPzK85eiLk4A=; b=lGvrgh21sG4aNcDQONcoyRr3Su
 KMgx5ihtl7FfIpuQ1pZEWu46gaGRX8Q3+5HWHmbkKAByQ1E8ADioeW0RoKD3dDxOxtKqAu8g8oDpA
 9/kA8Zd6cQcz3YqWR1WjWL7PmXjvWlh9l5PpJ1T/Xyz9VivOvp4N1vO9cYZ6uasY05hE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XF2DHR9cVBAjSC1JYb0fBkqyDH+OwSrCPzK85eiLk4A=; b=J+27ytICMPR6RynYsBTMg5YRyQ
 4LglMcqjhVaPM2oQRsRa5yvc3S2kbfIDRrpnfSR5jTj688BgE93LzLMVXNHEd5YVnv6D89jQ5NPas
 Ld8OtjnDnMaAFVw5njXQCu+uppJzhYBRKxTrAKaEH3pHO6yN4tNtRsRI1Q9Sg1I8h3No=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qYNIx-00CA1X-Lj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Aug 2023 09:04:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00BC06491C;
 Tue, 22 Aug 2023 09:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A653C433C8;
 Tue, 22 Aug 2023 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692695033;
 bh=XF2DHR9cVBAjSC1JYb0fBkqyDH+OwSrCPzK85eiLk4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfdzWNmx7Pg14qw902O4jsKZSBGRSmY/oKhOsFl8kTXzpD2dCG8aXEbO1/rE0ZaUO
 wkW7gHFOm0WqiUo80a3ffW8SXw2P3egg7B7HcuAGDxZTTfm9845WmToKjixMnRLGEU
 Kk3NVMfawizSITwLrCOT5zbjUbzVmVxG5XCkmg2SWd4KKKkWRZ4DDuezw0nEzvhfqu
 WZ0FixzI7Vdg6Mquo9lRimD3cN7Z7g/l8zN1SIRV4QYkP1eG7sQ98sX8aKe+oDo31H
 oSGAmprKHxWr2VyfmrB6w2j6qsTT62Vbld4kOY5YF/Qf1m4ie8cd9h11L1YFx472gU
 KrTHjD60ohIxQ==
Date: Tue, 22 Aug 2023 11:03:48 +0200
From: Christian Brauner <brauner@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230822-denkmal-operette-f16d8bd815fc@brauner>
References: <20230816050803.15660-1-krisman@suse.de>
 <20230817170658.GD1483@sol.localdomain>
 <20230821-derart-serienweise-3506611e576d@brauner>
 <871qfwns61.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871qfwns61.fsf@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > Targeting 6.7 is fine by me. will you pick it up through
 the vfs tree? I > prefer it goes through there since it mostly touches vfs.
 Yes, I think that's what will end up happening. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYNIx-00CA1X-Lj
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> Targeting 6.7 is fine by me. will you pick it up through the vfs tree? I
> prefer it goes through there since it mostly touches vfs.

Yes, I think that's what will end up happening.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
