Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208BB42049
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Sep 2025 15:04:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FWCicaJYx5qSutiBSAjXktdQEHxc/SiCHCwHJ8NIWAc=; b=RCjKNV2B1TBAJAMA3ck/pBxOg9
	YO98fB7LzNQQfWXSO9igL/D6q+BKG9FyBx1uWOTkYV2fox/7guBGaVvCnazvVtPMTFFHKEmAmqEwv
	gqGqfUIMHB9+o86gDmiaQhiiTdqwr5nWEciEF756ruWX/HVoZgq6maVooX/+bJfpTuWw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utn9e-00007E-Rt;
	Wed, 03 Sep 2025 13:04:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dungeonlords789@naver.com>) id 1utn9d-00006l-49
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 13:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEEKQmnI1buueRvDHJxtLZtEp4C6IfHBZayIiMwCn6U=; b=i7wyJNHzg+AUL3JzDt4t9GJgkm
 vBdCTO9dp1BDcLLya/4iTL3CK6xUXdVaqNPtGr4fX4ZH6GUFHCyr4IPkwiIFngnrMhceMs1r7MOVu
 oSiv5ZaZe2KeIBeknq/rN+anCgl3KD6NEL4G7uCxZ+Cnsqqlpr1t+W+8gRSUpyDtUf1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:MIME-Version:
 Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fEEKQmnI1buueRvDHJxtLZtEp4C6IfHBZayIiMwCn6U=; b=C
 rsCWEKLmYhDNG3/yiDFfgwfb3MnlXy+QoVEKcBXSU11XJ+X6wYTEw4CKT33CV6CIqlEgnsoT75es/
 ZnQryTRKR/K/b2eqJTEe9i1ypHJ0SBAWZcBLkgRleSjRCLT50Afj7ezAa8Vd0CtF0azSRl11Iw/rN
 qseO7ZzsPX/8GoME=;
Received: from cvsmtppost38.nm.naver.com ([114.111.35.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utn9c-0002jj-CI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 13:04:01 +0000
X-Originating-IP: 125.132.232.68
Received: from cvsendbo019.nm ([10.112.22.34])
 by cvsmtppost38.nm.naver.com with ESMTP id bpdSnHbWRQyGuFvb19dQjw
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 03 Sep 2025 13:03:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208; 
 t=1756904628; bh=ok6pjR1Z4MgJkPxicNNthfcsHQA689vc9SJCRaURvwU=; 
 h=Message-ID:Date:To:From:Subject:From:Subject:Feedback-ID:
 X-Works-Security;
 b=SS/jK87MR9n7ERLuoWdHk+KkJClE0JqO+Rd3H7z/gHAC1yux5iYLw750BNLnG+XDa
 ANk4aSzj1OOssNlvCE1M5is5AJYf0xCKdgch/3SaCT3oDh5I8y9i7cnpLc+iGfdgZv
 ZkKP5wwYJ3pHwO1veCHxEbyft60LpL5M/GTJBph3AR/RVIw/85nZfYFCANEcz7KiEa
 m6v9mWR7WwhJOMV2eW72F3UHpcc2/FLzT/vDp33Yh9YZHciRTKsSHQvF7FGeOpsLbg
 3wgyQ8bieVjPZMUyOKyS801kvaIxqngl/+bwYzDpCV7fCHMCulRF+KGGEHmNjmvIJq
 y3muGpMSNo8xw==
X-Session-ID: CNQ4qmSuQCy+KU-ubSB0jw
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: x/YqjAIYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: VZnXaAM9FqJZ+Hm/KoUZ+6E=
Received: from [172.30.1.76] ([125.132.232.68])
 by cvnsmtp011.nm.naver.com with ESMTP id CNQ4qmSuQCy+KU-ubSB0jw
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256);
 Wed, 03 Sep 2025 13:03:48 -0000
Message-ID: <2b1dddd0-6eaf-44dc-98a0-7a633597fe73@naver.com>
Date: Wed, 3 Sep 2025 22:03:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-f2fs-devel@lists.sourceforge.net
From: Andrei Cherniaev <dungeonlords789@naver.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Today I met that my Ubuntu contains environmental variable
 with name LD (not ld). I was sad surprise to find that can't build f2fs-tools
 because autotools tries to find linker with name ld (low case) [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [dungeonlords789(at)naver.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [dungeonlords789(at)naver.com]
X-Headers-End: 1utn9c-0002jj-CI
Subject: [f2fs-dev] [f2fs-tools] Drop autotools
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Today I met that my Ubuntu contains environmental variable with name LD 
(not ld). I was sad surprise to find that can't build f2fs-tools because 
autotools tries to find linker with name ld (low case) but found my 
environmental variable LD (upper case). It is behavior which is really 
hard to predict but common story about autotools... Let's switch to 
cmake/meson?

P.S. I also suggest moving repo to github...

Cherniaev Andrei


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
