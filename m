Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D32AAF2EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrXiFjoSl7IcM0GguF8o7XfHgWcOSlrK5KVdaI5f3aA=; b=Uhj5H9II0rxF+UYg5EoJrrESlV
	wis4UOqMTF731EdH06WsbU31VrCWQcAP63B8MNGDtghmZmMYLRnI3czC2A49ix794FewRUdrBPySA
	56i1ZbMAxvnLlfJsEYJQZS/h+mdWsQ3syNEGnzqZFZKolNjoat6h9IaAtNQemZ5Mhd1I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtqh-0005Il-S0;
	Thu, 08 May 2025 05:31:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCtqg-0005Ie-5D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dZnms2ENsE8YbA/ZsqPifkLq33JcrSBf3eafrzYAu9s=; b=ROdxJ4wYIflg1iS9M63HBRFCMx
 nohhzSsYm9k57V8HPu2JbKN222lnO7EtpDHOAEF0ibTUDJMiGNeYZx/+4n3xvho56tXIBYrOVg3Wl
 M65SM02OaVxgWQtIuZZsFZniNj8TluVOwH4gvWhePFe5IPUPgJXAD/nG1RAyIp90Nhmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dZnms2ENsE8YbA/ZsqPifkLq33JcrSBf3eafrzYAu9s=; b=mI6eNwOhNkXBWNMGPB6cBiBHnj
 CcK19h/LDWguA4qqivwBwC9gYOk6sqF3RpiDc2jtuhyKVoSLHkztc6DapLzj6QFuXbbCaxL97dIIs
 qtEsNsTELuHanG7odS/O2tbLNoebVe5PJtPAcId9H8zHDv4M16PFDUZHqq2KLkDK6kK4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtqe-0004HQ-3l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 682EB629EA;
 Thu,  8 May 2025 05:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088FAC4CEE8;
 Thu,  8 May 2025 05:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746682262;
 bh=A0gbx3wfSdRuPbdEKLgiwT1yRw4RpwyxZobvj/F08q0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VT+XagNGJ+hPtEtX899csYitcPXv3V3mDjYtdY5P+Xlbs2+Ega/3prTbOUujZOaBQ
 DgSPcZjMzec74sB0gqmcbVcRJpKWw5rBl/E2fqALjZLnVlj4pUQmamfbAbsOvuyOk+
 wHzojozITa/g+9b2//fLa0NUgURKilz14eX9GUlfMKZJa5JvFyIWVF2ZIdcHMzw1pC
 n71+z/OChJcR39xjH86VDWVvOKCJ/dCJfYzQR1W3GfhBY11ZfVKeg1TrRF78qJyr4p
 3PgRN3EwJ0bxB1UMGUp9nt2XDrP9L0OlxrXla3D0cdkL+EOb3YqNL1dHy3Uvw5OcL7
 flWn6WouLzLgA==
Message-ID: <1d47a36e-2182-44bf-a3b7-cdc5e07a820d@kernel.org>
Date: Thu, 8 May 2025 13:30:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-4-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250423170926.76007-4-sandeen@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/25 01:08,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > At the parsing phase of the new mount api, sbi will not be > available.
 So here allows sbi to be NULL in f2fs log he [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCtqe-0004HQ-3l
Subject: Re: [f2fs-dev] [PATCH V3 3/7] f2fs: Allow sbi to be NULL in
 f2fs_printk
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/24/25 01:08, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> At the parsing phase of the new mount api, sbi will not be
> available. So here allows sbi to be NULL in f2fs log helpers
> and use that in handle_mount_opt().
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
