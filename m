Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF2766B99
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jul 2023 13:21:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPLXS-0008Fo-Sl;
	Fri, 28 Jul 2023 11:21:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qPLXR-0008Fi-SR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 11:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4wdjXkM8/AvUr9AlBh9FaFRGOYPPhzD9br0e2nIAQ/g=; b=lFWAFpx1oCLCoqZ8isEkVscolB
 GEkXoSHD5axGFHgtHempZXN+wZuqSSwL2UDK/KcSYyTcktnSHQoDUKmmuGk7vLKb9wGlFO+rSo0m7
 UN8Q8QKKdL8Iwl58NsrVoVWf9m4mvY4qaPAv0RP0UrWYVPq4pkoHe06/whm583u3cUz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4wdjXkM8/AvUr9AlBh9FaFRGOYPPhzD9br0e2nIAQ/g=; b=SsEzUv0kqmomZ1x+6jgiabIRfQ
 HYMgwkneTcwFVNEcPgmjhyGTxLlIsGzmQ0Dx8ARoLlsfp2xrKNJP42YIAX9mNYds8uIpDjiGMiP/b
 02ukcXUrRDQ8Cwifvwm+qqPLazlaW/9zgRjzzGNIvA3F0nitXPFf69L6JzfaocTNt5Nw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPLXR-005S0V-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 11:21:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 212626210E;
 Fri, 28 Jul 2023 11:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63039C433C7;
 Fri, 28 Jul 2023 11:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690543295;
 bh=LSlC0Q9PHeWLMycbSGiyKu9Jet3YZB91XdJa3QEkOCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f65PDg5jIYm9aKIG3PUffcMnydDw1hkOhCi9pL7FWfDJUWCBbv4sKKufnj4XEqc1i
 gvRxcCsJF5Ov/J67+Zl3c7dbBF9Uf2lc9cBw7YBW/+J+B/ZauWrz/vIj32b8a5X4Xc
 VUpbCFKId+nISkTIujWp4UOIgLL15Q04/t/cl4XcBOiaewPZvkCrFoDwJyY4c5REEh
 t787Io7Ji13BwOLfatLk3+SCSBpUZeUPN1qKaVOZ8ggNN+c+RkiJ6bPUajKLnezCZ5
 nfdbH0bjodjBhRzAVJ6H3VFMB38JOT4s+9mUuvZvJhkt6IQFW1erVf1ZfFyWWJXsXf
 xMxuSJaIJIL4A==
Date: Fri, 28 Jul 2023 13:21:30 +0200
From: Christian Brauner <brauner@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>, ebiggers@kernel.org
Message-ID: <20230728-darben-zuarbeiten-f2f6b16fc001@brauner>
References: <20230727172843.20542-1-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727172843.20542-1-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 01:28:36PM -0400, Gabriel Krisman
 Bertazi wrote: > Hi, > > This is the v4 of the negative dentry support on
 case-insensitive > directories. It doesn't have any functional chang [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPLXR-005S0V-Ns
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 01:28:36PM -0400, Gabriel Krisman Bertazi wrote:
> Hi,
> 
> This is the v4 of the negative dentry support on case-insensitive
> directories.  It doesn't have any functional changes from v1. It applies
> Eric's comments to bring the flags check closet together, improve the

I'd like to please have Acks/RVBs from at least Eric for this since he's
been diligently reviewing this.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
