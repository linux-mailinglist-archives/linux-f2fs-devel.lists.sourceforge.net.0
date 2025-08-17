Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A8BB293BA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Aug 2025 17:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-ID:Date:To:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mgUN7ZGJe7UfyVKZcu0kR/2udVZdeLTE5ps0prxEgQE=; b=W6SWCtrGSibL+IQxphZ8PG26k7
	fBffbrOMzpSKXvP/exV6+SBFeBRUPq+nrbtRkkIy3uM0Nk7AYPr16BaqOAZxY/FTUY60JdboNxbiD
	A/icCEyHjoFrf5RRTQ2VDcpCL9uAaOrpC4cew31jqvwiatTBxpV22U5L3P3Qf0YP7kN8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unexF-0002Fb-4N;
	Sun, 17 Aug 2025 15:05:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <abnamro@nl.abnamro.com>) id 1unexD-0002FR-75
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 15:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Message-ID:Date:Content-Transfer-Encoding:
 Content-Type:To:Reply-To:From:MIME-Version:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=dQDdDfOUVQjrXjYzhC5cKJ5oJV
 +TyEDG9P3NmJBq+eQC8GVztUFDOU+3BKkFNHCElDutWU2l5DEwPnpkCRpdxr+7O11+GyPz3qJTO8v
 JkAT3KcgJMr01S6c2Pscq9wvAu4CvIP+PllxL9Tf9LbXFmBS9w/3sAIhB8KYOYLyxPhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Message-ID:Date:Content-Transfer-Encoding:Content-Type:To:
 Reply-To:From:MIME-Version:Sender:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=Zc9Y0TQc8jam3CggCCSJLvgty5
 zr8gk+fUpgi4xrZoL+BfAfv6bn1T3l24uYX5qmsm2jjhx20aJ0qK9aFVL+EHIuwRNL7owYLhrklF9
 cHZLQMnssQboK5Em9FbCzSRJFIxIzYk0NrWebKo3CeKTVTXmwZfI8OPIZL+yNLUYTwMQ=;
Received: from [176.97.210.237] (helo=tube-server.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1unexC-0000MG-IO for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 15:05:51 +0000
MIME-Version: 1.0
To: linux-f2fs-devel@lists.sourceforge.net
X-Mailer: Smart_Send_3_1_6
Date: Sun, 17 Aug 2025 17:05:38 +0200
Message-ID: <34561703888561296416762@cloudinit-windo>
X-Spam-Score: 5.4 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details. Content preview:  
 Content analysis details:   (5.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.8 MISSING_SUBJECT        Missing Subject: header
 2.3 EMPTY_MESSAGE          Message appears to have no textual parts
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1unexC-0000MG-IO
Subject: [f2fs-dev] [SPAM]
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
From: ABN AMRO Productinformatie via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: abnamro@nl.abnamro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
