Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7EC7B853
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 20:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pntmux7wT3Hf5KUgf1PYEkUrAQuTg02lO6yqLoILtTU=; b=dSsbe7s2EnFrPImXXgr1cQzTAE
	IZC1iOj1Lz7scF7Ez+8LXhehT7RAmgUr2rlZB90wDMcBOcZsytbnhBPBXPhFRk6csiiIKfFvAT0Vf
	L1BGNfM1/ccsYZSR+031IRaSLbJ6ne/1jhsrYq2WStz9JkmQ8WaLr+P1l9oST8IOlZNQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMWrS-00060A-O7;
	Fri, 21 Nov 2025 19:32:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1vMWrR-0005zt-Ps
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 19:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJYM9YHbTxQg/kXaHLW6rjUvf7Ew9PIh+L7t/LeEqjY=; b=lAucIBI9V1N1Hw0Ku+5nDTgckc
 6azf+fvmjywFR9Mt+Jhd/NqExYvpnl0EukDyHoZoWkchDey56gQqaWsRrUA719mDoxX/C4gdioM3m
 IpWr0pUl0yQGGHb9HfarRTyeBdfiYyX5GizR3+xNv54mk+wO2jq8fF224HtQFjqeuRuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SJYM9YHbTxQg/kXaHLW6rjUvf7Ew9PIh+L7t/LeEqjY=; b=kPF6G5YL+e+ezLFUJbqpekymxJ
 09og4JfsIZGpQ+5+94SDRvPbVjQPLrSlsWLE8cBRHlimlXtgtTDB2lCF+eSQcFYkDT/qFctOf5E7h
 CvxXPOwGoNGU5POphR9Wne2AtFzH8rUwwG5rw8mLS2vXeHjePUvuGP+z8qy2KzfadL/I=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMWrR-0006wT-8q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 19:32:01 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6F60240AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1763753515; bh=SJYM9YHbTxQg/kXaHLW6rjUvf7Ew9PIh+L7t/LeEqjY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mUaqTuCmO5nrIjzu1hQG4zRQJx0bGHTnlVaalT62oINeUMCUfVr5VhSbxnc0pK1B8
 o/Yv/IwrwXrLu2oI55HAGP7JsVBUqm7P+9qBsH+xtRZ7BkPPZhGctIiS1BexFURvQv
 1R5VtmaaYXZiKrvZhQUN5EriOoQ/pS2+OBGkVz/FvHmb1+4A/RDHEU+lJpgvjlktYC
 o0S1/2CyCfjjRWLOevig0/o2ER2YQ99974WkzRIaCgNIDUTvmQjlQgco0X39q3ceTv
 yclOidm5f3emPHLkqv0s2IwzvNlhmeOsqbZ96WvQkSclT+8U4azPkVEm6vN14QGh6o
 8Q1vQB9G6UTDg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 6F60240AD1;
 Fri, 21 Nov 2025 19:31:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <aSCoe_0bMTaqQ6tD@google.com>
References: <20251117122754.297742-1-nogunix@gmail.com>
 <87fra7tgyk.fsf@trenco.lwn.net> <aSCoe_0bMTaqQ6tD@google.com>
Date: Fri, 21 Nov 2025 12:31:52 -0700
Message-ID: <87y0nzrxlj.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk Kim <jaegeuk@kernel.org> writes: >> Jaegeuk, are you
 planning to pick this up, or should I take it through >> docs? > > Let me
 queue this in f2fs.git. May I get your SOB? Acked-by: Jonathan Corbet
 <corbet@lwn.net>
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vMWrR-0006wT-8q
Subject: Re: [f2fs-dev] [PATCH v5] docs: f2fs: wrap ASCII tables in literal
 blocks to fix LaTeX build
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
Cc: akiyks@gmail.com, Masaharu Noguchi <nogunix@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bagasdotme@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk Kim <jaegeuk@kernel.org> writes:

>> Jaegeuk, are you planning to pick this up, or should I take it through
>> docs?
>
> Let me queue this in f2fs.git. May I get your SOB?

Acked-by: Jonathan Corbet <corbet@lwn.net>

Thanks,

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
