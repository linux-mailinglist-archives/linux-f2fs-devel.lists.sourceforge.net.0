Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GCtHtxgEGpAWwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 15:57:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB43A5B5AE6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 15:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWRuGUzMG4uT95WSAvezwMKIt5ccXCXmZvPGEni+9C8=; b=VGDpTQXjCAzG0zJOSh4o6KDu2S
	U7I+iFUzSoO8UqI7VReRhuqQqizZfMDHUZKHzO8XQBci45jYVHIpRr3LNcQidP95E479E9tPUQeVZ
	sUwHwy7czhLHpGEdFAYGLM/sH/XsKO8PAs8DhwP6FNBGrozkgiPz0N8RlpuWrNDaMttM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQQNb-00070a-IL;
	Fri, 22 May 2026 13:57:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amktiao030215@gmail.com>) id 1wQQNa-00070U-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 13:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4SSqgZ+xBW8AJpHIxgNY5kInADkD/HLOymZ8JyZqvnA=; b=I0gSQP1RuvIeQU2u7IeZi7OmQX
 QWmNn/ZvLvVoUkqW9g29D1iBNg87vFGVrA52Z1mlx6nEsqdOaTnQWe7nO0yAV7SsHdjfR9g2O3Ykp
 rNsSC062Rlak+uN6tkfTNkO7v9VKZxWan2vG8zrJFBr1sJ/9sscRw6a3PQDH0CVQ4IkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4SSqgZ+xBW8AJpHIxgNY5kInADkD/HLOymZ8JyZqvnA=; b=luj4D/tlqUPRd4sq4oFQvBbawv
 Lp0rDu1Gl5/jqwUnmA6NhnuLOKwtNT/1osRxzubSWbrXzzihYUS8d5xyTgx3iqO4bNXpMiLuLznyu
 4FQwKXzcSpxeW+SeBdo3dOBOUKdQJa41TZf6xzqiQZIPH5fx3A41yx1ecrZSr+eRN+WE=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wQQNV-0001BO-QT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 13:57:31 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-8353fd1cb5fso3603423b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 May 2026 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779458240; x=1780063040; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4SSqgZ+xBW8AJpHIxgNY5kInADkD/HLOymZ8JyZqvnA=;
 b=F064wfyP9ICyWw3c9r273s5ULIZXfOnaY1EZ6kkkDQe0m7M1vpJwqJ+i/83ivVwNu1
 rqCw/8SKIMV36k9rMORvzxp6G+bBn25uI2BAxoWEHnelFY+uaSnaTNJCSn2ptPDimfSO
 8tLo9ZLeacuHVWRasR/n0U1pLr4Zv5/u1w9MARlZhetMoF6F9VgbsheJeDWv/cTVNyjj
 j9qyeg02kTu3jIhd63TvV+FuPW5ECEtxriafKMN3M2dZQC6wCXAxUkO1ma/tj2FmQMEY
 lP9yUJs/pGRmhehATf7nkcsVMuNTdc94yceuK94+kTcqv3ozZ40gbGR5ejMyHppXxeJo
 X1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779458240; x=1780063040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4SSqgZ+xBW8AJpHIxgNY5kInADkD/HLOymZ8JyZqvnA=;
 b=B4n4cX0/QMRtdC5yciWPemQB6oj68ckPSbfI14VvBjpoRA7XHrIF+GwR+wgNY3BLu7
 fp1F+KdHE1fu86vNnbJlboVDP/YRhmHglwCIuulP+MFX3n4LjrmTAOOGs28uumCWxe0E
 rBBweLQuU10uwR8wlfGX7lR+CAtT2ReS4tEskga/p61lGYKapLvbYbYFBYEj5YteK7Bt
 Il1DTmQazqxVvFGocxb/5lSe0wGf+a+FoOVEQdnqBb5aZV4XejwR7in59nrlYBZ4pneS
 jrf1huOvG66x0sx8QW5P4X/6evxYeoVsw2Y53IVNTW44AxWEzABi+EqBVBzANu/TwAk5
 HP5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QaHbb/f8t+U7J8fW6Cg2/NPUH0fZspfr3LzaeE7iCrBY6eZs5QOyg70MNUOC2FkBpl52S5IBOYKGD3nVvVJP0@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxOws8XmiTqO9aJ8NOcyX2swQbigAT09tiA3WANG/k2VsyJ4C01
 Y34KmRg8RvG4UncDDj+UuFJd5006sq8e8/WV8G3NaeSkljArcw8XlFIH
X-Gm-Gg: Acq92OGLX0Ys0q+2P+I4w3gsWEMwzo3gd1ZRNqMii88ZAes5MJIiI9Q7ecLzKLuxgei
 uDA6m8wnmArlUql8f8rq7oyl3wG0CS9bW1Po1duFMRVm2Ed+TYU9WBx5+gGB+YfPJPhqVWIVrTC
 Ate1SMQCJogMKY1mwclnVx0HbdNBnesw+3yQ++klOas9cMtoceWvAGIWAWLljQuzLkjvpbUd/h3
 aOQMIpgfprMjBSVOFlZuGCCXV989gJVbBVy7q+9GO9GxekvL2x97j0hj74YTXLH+HpmerJ7VFAa
 9ww/UcZnbq9inye0sjrpJZzD8nAPKhEuanh5Hc0OBqCpmWzxm7pqXf0+UzkL6LKYaukf8Uzo3Q2
 cHWMHeifroubXRQrGiVBE5AtL+DaKD6KQ2L/0knCyLSG39QEqRAQkEKjQaLn+6BZC4/HUrO2akq
 bnlZVeFRQeXlpicVTM1LNeza/2/P+YazU8l6hgSRgriQ==
X-Received: by 2002:a05:6a00:2407:b0:837:8a0c:8f70 with SMTP id
 d2e1a72fcca58-8414b5523e1mr5862028b3a.28.1779458239573; 
 Fri, 22 May 2026 06:57:19 -0700 (PDT)
Received: from localhost.localdomain ([2408:8210:c68:1df0:15da:df1f:de46:f7d4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164fc646bsm2135061b3a.46.2026.05.22.06.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 06:57:19 -0700 (PDT)
From: zhaoyuenan <amktiao030215@gmail.com>
To: chao@kernel.org
Date: Fri, 22 May 2026 21:56:54 +0800
Message-Id: <20260522135654.19535-1-amktiao030215@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521151008.13682-1-amktiao030215@gmail.com>
References: <20260521151008.13682-1-amktiao030215@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, On 5/22/26 10:50, Chao Yu wrote: > Hi Yuenan, > >
 Thanks for your contribution! > > If there is a method to get pid via
 userspace, 
 I prefer to do it in userspace, > rather than implementing and mainta [...]
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
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [amktiao030215(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amktiao030215(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wQQNV-0001BO-QT
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add ckpt_thread_task sysfs node
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amktiao030215@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amktiao030215@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: AB43A5B5AE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chao,

On 5/22/26 10:50, Chao Yu wrote:
> Hi Yuenan,
> 
> Thanks for your contribution!
> 
> If there is a method to get pid via userspace, I prefer to do it in userspace,
> rather than implementing and maintaining an duplicated one in kernel.
> 
> Or do you have a strong reason to do this in kernel?

The main reason is that retrieving this PID from userspace is currently
quite complex and fragile.

Previously, userspace tools had to rely on pipelines like:
pgrep f2fs_ckpt-$(ls -l /dev/block/by-name/userdata | awk '{print $5$6}' | tr ',' ':')

This approach has a few drawbacks:
1. It requires parsing major/minor numbers and executing multiple commands,
   which is inefficient for simple monitoring tools.
2. On some older kernels, the thread name can be truncated due to TASK_COMM_LEN
   limitations, causing 'pgrep' to fail to match the full 'f2fs_ckpt-X:Y' string.

Exposing the PID via a sysfs node provides a deterministic, lightweight,
and reliable way (just a simple 'cat') to fetch it without any userspace
guessing or complex parsing.

Does this address your concern?

Thanks,
Yuenan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
