Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39017633808
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 10:11:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxPIw-0000SA-Eo;
	Tue, 22 Nov 2022 09:10:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zbynek.spacek@axisfairfi.com>) id 1oxPIo-0000S0-Ry
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 09:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0BgaW9t8GFER5QecxVkFsHrVi3gO/4V5KAZgJaiRYBs=; b=iLQjx711HGjOKBfVahEZ/7pMs8
 BtoAafMw0xHgpXBRkDhJpsCLDoyZfdqkR5K4wkv9tTpS8yhOq6mnADZ8lm00gjnnnNExovmRaZ0o1
 zLr6qkD7x9XqRAYIqP6q0jnk8baAqE4ASq9l/L6O6+RVstKShY0bPJp8kXb2PaolkI6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0BgaW9t8GFER5QecxVkFsHrVi3gO/4V5KAZgJaiRYBs=; b=j
 jTHOhKstkJRGvNbljczJo/F8mZ2M7qkMUNlbZgewEoutkas3J4Tq6LFYdpEDEmx4xE0lgdiM5+E/8
 E8JpmMJm0jr6YzZulQJUIJkrGmjLdLaBGNsrkLhlKFMYp89IpgQ84RyLGMfixX+C3pohFZfsFxUTH
 TwA/T0F3Xeg6Q8r8=;
Received: from mail.axisfairfi.com ([94.177.230.134])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxPIo-00BDy4-7K for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 09:10:50 +0000
Received: by mail.axisfairfi.com (Postfix, from userid 1001)
 id 42827825F4; Tue, 22 Nov 2022 09:10:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=axisfairfi.com;
 s=mail; t=1669108243;
 bh=0BgaW9t8GFER5QecxVkFsHrVi3gO/4V5KAZgJaiRYBs=;
 h=Date:From:To:Subject:From;
 b=B8HFBKt5Qln5o0fQiz6ioQ8uQ61R5Pqi88Qm2kTY92iCLkkoUuno4KJCuV4o7VfuV
 0CjTgy1OjsSLWaPK0Q+uORo7Fh+Zy/99WPIXANMqO6yDn2y/kBIJS3214+0sHuYw6/
 iKgfiwFTsLAMI1KRwOuUkMD7x0mHUcI/p+7n/v++gAv02DlwE51WFwJWctzMPAeLY9
 vjgEGQETDYReBan+jvccg8y/1kNpfVXuAHwM89vYsiTgjgPpHPCozyxeidjHjLxSwk
 /mtNjJ84ieWfBiadYkLXVT/XdWQK2C9/L/yjxHaREn36kCeyy7aCSHH08cmHn4/D2i
 lf4e6LDR5/JBA==
Received: by mail.axisfairfi.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 09:10:36 GMT
Message-ID: <20221122074500-0.1.d.o0i.0.ms21opcgu6@axisfairfi.com>
Date: Tue, 22 Nov 2022 09:10:36 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.axisfairfi.com
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Good morning, do you need intermediates for processing,
 plastics
 (e.g. rubber) or silicone mixtures? We provide a wide range of silicone
 rubbers
 with various properties, silicone mixtures from renowned manufacturers such
 as Wacker, Elastosil LR and dyes, stabilizers, primers and anti-adhesive
 additiv [...] 
 Content analysis details:   (0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 FROM_FMBLA_NEWDOM14    From domain was registered in last 7-14 days
X-Headers-End: 1oxPIo-00BDy4-7K
Subject: [f2fs-dev] Silikonmischungen
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
From: Zbynek Spacek via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zbynek Spacek <zbynek.spacek@axisfairfi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good morning,

do you need intermediates for processing, plastics (e.g. rubber) or silicone mixtures?

We provide a wide range of silicone rubbers with various properties, silicone mixtures from renowned manufacturers such as Wacker, Elastosil LR and dyes, stabilizers, primers and anti-adhesive additives.

We also produce technical silicone compounds with increased resistance to oils, resistant to high temperatures and water vapor, conductive and many more.

We provide fast order fulfillment, timely deliveries and cost optimization.

Can I introduce what we can offer you?


Zbynek Spacek


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
