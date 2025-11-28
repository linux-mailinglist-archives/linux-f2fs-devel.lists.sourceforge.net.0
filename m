Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B36C90CCD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Nov 2025 04:50:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnfKiRpbwFK3H2iaEyPdVc6VRzt2P+Yzwf+svdotGlA=; b=Y91npkxclr7zkWndqO7GWMTARc
	Wv2wYUY/NPdN/61EEAxm0XrgFJNBHdfGXu4dTDkZ/2VrI3kLFW3hFbU5xlF7fVXu2KBCEuYTg0+u9
	x1lTsm5kheqf4gkkcyL8vyKJSRO0w33yhxJIG0I09wHjn1BX0e8IpzyLqfF+J+4Pr+w0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOpVF-0004pi-Ai;
	Fri, 28 Nov 2025 03:50:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vOpVD-0004pZ-Na
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 03:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RACFBxwR6j3Fv8rdvrCwxpEiMj77YoVgVOBhkk1n3eU=; b=eD95I4hsT8N4NRO0jbw0uwz3Be
 0/qEjvlmKJDZGYQNhAC9yesiE9fiM3wu5E29Pi9zz7S9VCyDsz2c9rayAq2n0TFDnZ7jYQwDlZG0t
 oPczhRXl4CUaEBDWL3yG6B6g4P+vubq+VuayvvDCRagPbLaEqQTBWsE+UCZaNlJy+M9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RACFBxwR6j3Fv8rdvrCwxpEiMj77YoVgVOBhkk1n3eU=; b=ZvMZIiW1nItGyizSPIcWdbtFVa
 j+jNT5qUv49XJyGwGsDWb5VTCvRKJ8OiPsOvqKYqS77Z79yntzoOVUkl/Xts5COER3hC2ghpbsvDF
 2x0SBWTSvcIlj0FqaULar7qoIX47cIN7NFjGwk8IEMProEGdsAQbbHp3H/Mq3A1QJDrM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOpVD-0000SN-2y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 03:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 764C76013C;
 Fri, 28 Nov 2025 03:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B55C4CEF1;
 Fri, 28 Nov 2025 03:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764301829;
 bh=aoFib6Uz9Kr8raRi942VeTsQtGNE5GmzKR0u+9HdGN8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PXQlKjMSuNTbjN70MqmyMtJqkAuuWC3JMt848anEFG7aR0uDcv2T0OJPTzxK7Jxcs
 yP3CGPDs3+fy4x2KMB9SDa93ULmvZM8ufggX9s4Fk+qpdbryyhjrBzqrwc0dYejUIG
 NgZ9WoLLx57W60zMqmxDj8oLwopGd/01h7elytPx+38y5PJgH/8NCQg1+gx42R6kgQ
 Zp93ujiR2z6Bp4qAzDQM9A8ZssMv5YV0mJMCLlb73MxvnzNhVRc13SoDJ2EXHzlulD
 xnV0wEcc9GfEq48BWAms7urYirAEkWLQV819Y7rbFUmw0ghCkzLS/wF3rKpQpp3LKy
 gs2tsbSmrugqw==
Message-ID: <e12f45f5-f4d2-45cb-b281-8cb1371fa966@kernel.org>
Date: Fri, 28 Nov 2025 11:50:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: YH Lin <yhli@google.com>
References: <no> <20251128032509.825003-1-yhli@google.com>
Content-Language: en-US
In-Reply-To: <20251128032509.825003-1-yhli@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/28/25 11:23, YH Lin wrote: > This patch optimizes the
 tracepoint by replacing these hardcoded strings > with a new enumeration
 f2fs_cp_phase. > > 1.Defines enum f2fs_cp_phase with values for eac [...] 
 Content analysis details:   (-0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vOpVD-0000SN-2y
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: optimize
 trace_f2fs_write_checkpoint with enums
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/28/25 11:23, YH Lin wrote:
> This patch optimizes the tracepoint by replacing these hardcoded strings
> with a new enumeration f2fs_cp_phase.
> 
> 1.Defines enum f2fs_cp_phase with values for each checkpoint phase.
> 2.Updates trace_f2fs_write_checkpoint to accept a u16 phase argument
> instead of a string pointer.
> 3.Uses __print_symbolic in TP_printk to convert the enum values
> back to their corresponding strings for human-readable trace output.
> 
> This change reduces the storage overhead for each trace event
> by replacing a variable-length string with a 2-byte integer,
> while maintaining the same readable output in ftrace.
> 
> Signed-off-by: YH Lin <yhli@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
