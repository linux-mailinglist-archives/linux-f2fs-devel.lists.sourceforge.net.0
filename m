Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id viwiEpj582mA9QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 02:53:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E64A963E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 02:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4KS89st08GXXsLjV/p8QPoCpTuNtxgQMqSvBbJbCO4=; b=YOyjJ4MapvlXgMaKKTGtN6jFGT
	hNuOK8WtftAkZ51uoOz0+CTr9FyF+rnGBuYWBqd0A84zGVqrfWl6tgYCjXg2VrIEL9nVXtlSJxcTt
	FJ+ejjA8BrhP2XZK3wO0N9sRyeTEMubJAn8Kb5pDtfBZfxDYgzPuoz5nOG8M52sU2F6I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIc8F-0000RI-Hu;
	Fri, 01 May 2026 00:53:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1wIc8D-0000RA-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 00:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KzQTclZuCoJfZ2MNb+MG5u6QR+eoQTmWjD0e6rKq0Qw=; b=YX2m4I1UDoAsw40QCEbvXQWVoQ
 xWprhqO4m+q+wxhHf6lgjkOP0M0Zqn+oCAWJegqmOiyUJ8/uT8qsI5kcWnovefH6qATnrZi1Qs9vM
 VIQMNolkJzp9CWg1p1lhSJUK9GLiwZtXny1ETZdl4qnfPzItF2QOgjGL9T5D8xJNlO1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KzQTclZuCoJfZ2MNb+MG5u6QR+eoQTmWjD0e6rKq0Qw=; b=hi2+ll6v/H0vyTqDg5hY72AEc7
 P8k+X31Kd4ecm3QhLIf38FVqBc5Le38nZf13I8cEvUNBRqtEMB840xjaPWsS0oDq7OGpmkjPshCFO
 Da+sTB/F1Rslzazq+RaZgPNX0nugY6cGlOroWQVC2mK/PPKzhqt4VI/nIJvrQG/yuriA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wIc8D-0003iw-0E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 00:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B0678440EC;
 Fri,  1 May 2026 00:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA5EC2BCB3;
 Fri,  1 May 2026 00:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777596799;
 bh=KzQTclZuCoJfZ2MNb+MG5u6QR+eoQTmWjD0e6rKq0Qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GlJD0K60kmdn1mNAXeHnhfZsjneL3nGCWYf7I/ZdXgzyzXQJiekK1lMzcW87+hydS
 GoiCqTdA74XmXhhW+iC0cBGCE8BaWJiGzYNravm2WFtfEpI/MClfEujZDcqvC81R6O
 Q3KmaylAZtD1v9RUDf1OAYzGj5piq+8YRmHjE68bqcsQMJAfuGV5lkir8KfKKn8E4H
 EMBkRqcOK562uwtlI1/4uF7az0QV2TIBJ4Uvr07vNVOb+4NeFToXgKhU+uUH2H1eca
 PgJ8cnlEAUM69P+ObisYRWX1WWuBmLzQ9NQj3ZWG1EsET19jcyHKf/dzvxZsJzyiua
 xS+W7g+nCYBLw==
To: stable@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Date: Thu, 30 Apr 2026 20:53:17 -0400
Message-ID: <20260430160000.item006-6.6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430054510.2001015-1-rob_garcia@163.com>
References: <20260430054510.2001015-1-rob_garcia@163.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 30, 2026 at 01:45:10PM +0800,
 Robert Garcia wrote:
 > From: Chao Yu <chao@kernel.org> > > [ Upstream commit
 8fc6056dcf79937c46c97fa4996cda65956437a9
 ] > > As reported, on-disk footer.ino an [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wIc8D-0003iw-0E
Subject: Re: [f2fs-dev] [PATCH 6.6.y] f2fs: fix to detect potential
 corrupted nid in free_nid_list
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Robert Garcia <rob_garcia@163.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 967E64A963E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[163.com,kernel.org,vger.kernel.org,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:chao@kernel.org,m:rob_garcia@163.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[sashal@kernel.org]

On Thu, Apr 30, 2026 at 01:45:10PM +0800, Robert Garcia wrote:
> From: Chao Yu <chao@kernel.org>
>
> [ Upstream commit 8fc6056dcf79937c46c97fa4996cda65956437a9 ]
>
> As reported, on-disk footer.ino and footer.nid is the same and
> out-of-range, let's add sanity check on f2fs_alloc_nid() to detect
> any potential corruption in free_nid_list.

Thanks, queued for 6.6.y.

--
Thanks,
Sasha


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
