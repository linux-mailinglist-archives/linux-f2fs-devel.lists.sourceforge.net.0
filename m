Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9ADB3C1BE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Aug 2025 19:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=roqyVRXyClZbhqcqvJdLfW4vUM9ZVI+R0MmGI8s5iiA=; b=ji/aIpkklxGTDMGhyGUXDyz3uJ
	SaeLKxrqKQe4CaodYusZpOA7aw0qMSOBVxNCI53Ewd95IM3SPE1KUOV/tQRu3XgHuwZxXlM6JONfS
	XeUvkltYV6lZDKCZgYi3SsAdnHpz9IpZCoi/kAjx5YrjRoaGJzx8cBdiSPCg97/Vq1FQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1us2wT-0005CS-7l;
	Fri, 29 Aug 2025 17:31:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <test@notificacionesbys.com>) id 1us2wS-0005CM-4p
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 17:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IZxtw3z/9CaxWzHuOMx6eYG39iga0noJxPVFtMhYG7k=; b=esSdZUcgYvJbeBTl+f/xXLf2cY
 zUW1PqqbInU9BSB8SbjFq3amh/NyRkGoXVyHQmc+JB1dn5POW54FqwUFyf/br6bnOfhaBcoZ4SK/+
 I2NkA6HCykMITT14bl1wxiCH7oJrIHXsZjfRMTS18w9y9hh2wZezeDBqaZO2JTzFRvYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IZxtw3z/9CaxWzHuOMx6eYG39iga0noJxPVFtMhYG7k=; b=O
 MwWDsBM6dyy81htmwudOt7TJnnovdtIzLDhHCofjE7BbpvUhq8bpfj7mH5pzSPsnZxeDsyKJ4NEKx
 1GY6VE04a99M5wbmZxa+4s8+zQ3n34fq8afzeru8tV7amEIIAVGSyp/S0qFq1rTcNy7B+L2pfLPzg
 O1UHbJ+1qWISHUpQ=;
Received: from mail.notificacionesdecoperu.com ([190.116.59.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1us2wR-0008Ab-IH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 17:31:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.notificacionesdecoperu.com (Postfix) with ESMTP id C6A2A1CD65C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Aug 2025 12:28:37 -0500 (-05)
Received: from mail.notificacionesdecoperu.com ([127.0.0.1])
 by localhost (mail.notificacionesdecoperu.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id onPkIKUW9GbG for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Aug 2025 12:28:37 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
 by mail.notificacionesdecoperu.com (Postfix) with ESMTP id A142D1CD675A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Aug 2025 12:28:37 -0500 (-05)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.notificacionesdecoperu.com
 A142D1CD675A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=notificacionesbys.com; s=804FB474-00E8-11EF-9D29-D8BF0EF47FA2;
 t=1756488517; bh=IZxtw3z/9CaxWzHuOMx6eYG39iga0noJxPVFtMhYG7k=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=dHRITxoluKEqLuuifazTpuqFU1GnwVd97deL/1XPXv5dN2KYSdZkNMyPOgFOSwOiG
 BIoaxNqkAqDO+j27sA9e6WXk6E8lazHVHOZoJwIDxv6nWR0VtYY1hxFzJyK61X9IvO
 kpT55eldUrDAvZ5zhpSUvykkYQdT83TwMv3V4ncTCOTfSYMvWgOsRoYb33kkPUDCMh
 KRpyt84B937pkTzel7/yn1n1FAXUBhds8xQniPmY7c8xzBxrMgOSLszk240Hb+t7db
 5AVyZm5YUStO16gwmFK5Q7mMXIeuWD4rAJJMtOmidYPOjRgFNBwF+IAo9moDC6frpA
 tizPNwE6HCTEg==
X-Virus-Scanned: amavis at notificacionesdecoperu.com
Received: from mail.notificacionesdecoperu.com ([127.0.0.1])
 by localhost (mail.notificacionesdecoperu.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id BXh7KN7T7k11 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Aug 2025 12:28:37 -0500 (-05)
Received: from [45.250.255.20] (unknown [45.250.255.30])
 by mail.notificacionesdecoperu.com (Postfix) with ESMTPSA id 0BCAC1CD5EB7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Aug 2025 12:28:35 -0500 (-05)
To: linux-f2fs-devel@lists.sourceforge.net
Date: 29 Aug 2025 19:29:24 +0200
Message-ID: <20250829192922.8E0122C5C34FDE51@notificacionesbys.com>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Good Day, My name is Luis Fernandez,
 I am contacting you because
 we have investors that have the capacity to invest in any massive project
 in your country or invest in your existing project that requires fundin [...]
 Content analysis details:   (2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1us2wR-0008Ab-IH
Subject: Re: [f2fs-dev] Good Investment Proposal
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
From: Luis Fernandez Consultant via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: luisfernandezconsultant@gmail.com
Cc: Luis Fernandez Consultant <test@notificacionesbys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good Day, 


My name is Luis Fernandez, I am contacting you because we have investors that have the capacity to invest in any massive project in your country or invest in your existing project that requires funding. Kindly get back to me for more details. 


Best Regards, 

Luis Fernandez


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
