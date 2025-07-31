Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF246B17606
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 20:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77V9p5DYgaSPL/ZdgAzgODE/B7cS+9W/wnXIZdM55y0=; b=NOZbiu1hcWxpwd3JYYvFH7jRfw
	UZev0ZJxJflEdudmEwnWQth5OVIT4wUzY0pqsekVevGGuYd3BRQg5I81Q9i8O1hCPgx5vSr9kO/Ii
	Iq5KdzB/Hn4SaVvHvMfR+pesyBeYySWTV/qAciuyDM2u5OATuKxZI0vLqcK4OpptA9X8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhXoQ-0001ws-98;
	Thu, 31 Jul 2025 18:15:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1uhXoO-0001wl-5s
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 18:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nL6bD08cavWWnInRlvrh+XvoW6IfwsGnjrYNzsquKbA=; b=K4g9H+HsbHcfLFgp/oRi01dXiZ
 36+hnYcoXzEeBw9OAYO3H7t6fcsRmKseWTbJYL9wBVn/KrcDEJZ1pFQOQSbUuJN4W6har4tyRZFrS
 KBPqeq/FLrko/CntTTftj7gzI18KrKv3Y2HcHpEqHR2jDHxMRiLLF+MVkkj5BQCW+qsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nL6bD08cavWWnInRlvrh+XvoW6IfwsGnjrYNzsquKbA=; b=RJKWTCSkQ1O4ezFZcpSYFT94Ha
 X8FnmoVLSueVrvMW+npiGDOd6bnU3tv27mDqEQ328Q8qf7Xe8lsxLfKyKTB9ZLf74VJnhOET4gOTy
 NPxW+F3fUhI4Hk6hVhI0dHJFHW2w5UeoZW1Yjef2x6LZE/JZMnQKG8FGHF6qB+B1Xh7Q=;
Received: from mout.web.de ([212.227.15.4])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhXoN-0004vZ-7U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 18:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1753985720; x=1754590520; i=markus.elfring@web.de;
 bh=nL6bD08cavWWnInRlvrh+XvoW6IfwsGnjrYNzsquKbA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QH4cSGOimtUDQcSwQq9YkWlthXbXUg6n3MjDqIDdtYyRMkDMP3f92jy/LqL6qggl
 LLkIvpxUqr8KtVnz3dPUY/1b1fqPjpm53aJIqPZO0kl0m5bn4G7f3U4DpSrKmCvfk
 tVMl+Vy2G5TX9wofdHiRWZ1vJQCMl0Jghcuh76gjXQz33Y8rTqd3cqfS3U3HBhLhG
 nQIi08QEJM5aBqLKApv8SPJWf71cwdtqkOx2z2WJDpZIcCPZ96iA9radHkA3HVPI4
 IsyW6bIgHk/ji8wdr6g7AdxxKvV+Myya9GAePJ253n0Ead/liZz2Z5QZ1/xBWeGTd
 mAT9VW+EwYHr94XaOg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Pda-1ufuBK1JBW-00ERTB; Thu, 31
 Jul 2025 20:15:20 +0200
Message-ID: <6bf76f9d-dda4-424b-a0ee-a03547ed5b86@web.de>
Date: Thu, 31 Jul 2025 20:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: masonzhang.linuxer@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 Chao Yu <chao@kernel.org>
References: <20250731151917.24800-1-masonzhang.linuxer@gmail.com>
Content-Language: en-GB, de-DE
In-Reply-To: <20250731151917.24800-1-masonzhang.linuxer@gmail.com>
X-Provags-ID: V03:K1:IPV5vziLeui+tlVRJvGQ98KSrZtJ88yF2dZGqZkHLBb9AxOFRhT
 oD6OP6Onyd12IrJGiqZCYlOv61f+gVHPjYJsZXhRZksORxqzFpu4x4d2lhrr4jeAjhzIeQj
 jY0lKlQS+UDsUrCqluUT+KDSdFBmER+b6DM0tKQLuDK1rB8MaPRGGnb8NfkLtBVJzr0JiM0
 oKWZqOyY7pSSXtjhi7nyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wThGtQG7gzw=;vxLMV8acAr+Xys20CFCWKkFVjeZ
 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
 gOfXZIFQVsO/9hXDDTz+ujc=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > Otherwise, the filesystem may unaware of potential file
 corruption. I find that the change description should be improved
 considerably.
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16#n45
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [markus.elfring(at)web.de]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.15.4 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uhXoN-0004vZ-7U
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add error checking in
 do_write_page()
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
From: Markus Elfring via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> Otherwise, the filesystem may unaware of potential file corruption.

I find that the change description should be improved considerably.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16#n45

Regards,
Markus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
