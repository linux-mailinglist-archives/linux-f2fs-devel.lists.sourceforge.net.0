Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K9KK2cfsmmyIwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 03:05:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EE26C156
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 03:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wmjHvZAgM5XEwvJalohiy9P6Dk+Ja7nDY5PND1UWHA=; b=I2AEeBaSA3sCAj6Fg02oFIjqeI
	d2mqX/T6urwDHrdz/d9qsEe3LRf8uJ2wVx5LZ5eYTJfq54dLvic3KAaJQdDdTggNezN4OtoNuRXds
	aS9UngAlUOGyrzjhU/fXLI3f/vF9mBKlxnfC7TxOcsypD2fqadbfsurRdNMTj8hLH/aA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0VQT-0006TM-Gi;
	Thu, 12 Mar 2026 02:05:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0VQR-0006T5-J3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 02:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5v8LTDnJhzm9Y7uouPrm0MUhLo8yf4ckTVrKUICZxY=; b=UZ3OMnBdvo4uHc3Dc5sA3yqVYU
 IHJjlgnV7lGAUq3iL2Xzr07m020gIeuQVxRgL/ignBRefe9+4SfSQVFPbbkaQNFQGSjgWL1f3Y5BH
 2O7JdEWvYomPBPIl/BrXOPTBe5BT9uawZh1A0F0uzZPHLERht3G6L6Uong1z4tMTxRmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V5v8LTDnJhzm9Y7uouPrm0MUhLo8yf4ckTVrKUICZxY=; b=HI/uNGQJ6rySyqooEVlDhVooL5
 o8uJ5JQ6W3IkVgucoD9VAAsAWx+frsrFO4L91/n1p1oVoEIUF6SeXvVv9eRzf7RaqfhesmxBgzo6l
 Q7ix2plxDBArnC/+kXkHsttwi8FYMHpA2bO8/xi1JlsPn3VCvMJdrvbMSVZQndqpXoUA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0VQR-00059B-Mo for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 02:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6AD88441EA;
 Thu, 12 Mar 2026 02:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6652EC4CEF7;
 Thu, 12 Mar 2026 02:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773281118;
 bh=8DOJwLks4i9HVYNvW905RyeENIG3RMyFG1QpNrCPUBE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RooDS1vsfrMWwmM9PJ4FeGRHCpnB5QJQooSBjG35dtS05OYU5pvaGs62weauhRwzk
 G+faB80TVgPITCLlmSsvjatER9YMjqGvvpj6I85feRDX5MuAYyyv0884JhBGF/Tf/6
 44BuzDtGB3XFWv15ibqDZ5WPWQvrXXFHqruTi4ys4P6KgKUJmiQElE2RcPuFTQxkX9
 cf7kd+OqV7htZLDuoCHWforxwAemainN3VHJGROg8jVcVn3yKYdGetL9bjuKGACUn/
 WuazSYugNNpJ6KNgpW/D6IvqN6zCh02Q2HUdoyrGVGVooxmyzd5j8OFqqdn/lfjMpS
 PF/Wx8JnwxHHw==
Message-ID: <11512584-09c3-43a0-b380-0b8e98cadfa0@kernel.org>
Date: Thu, 12 Mar 2026 10:03:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20260311083530.2582720-1-zangyangyang1@xiaomi.com>
 <20260311083530.2582720-3-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260311083530.2582720-3-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/11 16:35,
 Yangyang Zang wrote: > Add logs for zeroing
 SSA blocks and add an ASSERT to > prevent the issue of zeroing main area
 blocks from > recurring in the future. > > Signed-off-by: Yangy [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0VQR-00059B-Mo
Subject: Re: [f2fs-dev] [PATCH v3 3/3] resize.f2fs: add more logs in
 migrate_ssa()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zangyangyang66@gmail.com,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: A61EE26C156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/11 16:35, Yangyang Zang wrote:
> Add logs for zeroing SSA blocks and add an ASSERT to
> prevent the issue of zeroing main area blocks from
> recurring in the future.
> 
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
