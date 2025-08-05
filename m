Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2CB1AF88
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 09:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:To:Date:Message-ID:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4GDL9RQx8hYp45lDi858I+hfnP9AcCuMZmdJw04Y/qU=; b=EjbTH79Gqx1kfTuS84sE3vcKny
	k7fjJ1atQlyf8VLr231cJIxtQcHPD0KiPUAO8RFF7NPO76hnicluzSu1g1TgqOLZXOEJvHdCwTZMR
	XkF7T325sj6opyy3OEan5MHLBljezMnDnEkt6+qNqtLzfmvFZHLPAtx7i8HZHjxgs4EU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujCJy-00011b-9T;
	Tue, 05 Aug 2025 07:42:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jon.brennan@tasknomic.com>) id 1ujCJw-00011U-Fm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 07:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=; b=Ts0g7x1uj4yrZikd6ssVLL5k13
 mXFiYLFwPRXwIuykT7cgl6ABt/1QInZ4hWY2YvK0h4KTPfOzS6wh3EHXT+UU2/C8udGmVX2vM0sok
 l++xMkUtIZsEFCaax83veodAKlVuE1zvxFkMpFUolWqQD8Fx4+eZUbSKGBI5O90CPQuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=; b=D
 RJWDbziB2r5xLTUU+83ouueAs1KWefLdfr9hOiN4JbrwOyL5Q+73ysQIxAJtdxaZALVqImVqiC0zW
 JXOYDyYpVOmOmzxAEqCRwGNiamOAUy2Q0ilUGtI3fe9AbL2A68xBOekHhU+M8uaNLOuabDOvG8O/d
 6gggWm3N7qC3/afc=;
Received: from mail.tasknomic.com ([141.95.16.86])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujCJv-0007oe-Ts for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 07:42:52 +0000
Received: by mail.tasknomic.com (Postfix, from userid 1002)
 id B1360A4EFD; Tue,  5 Aug 2025 09:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tasknomic.com;
 s=mail; t=1754379689;
 bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=;
 h=Date:From:To:Subject:From;
 b=cWIzYaKi+8CwLOOO7GgKq8WVAU2t4Eyj2wxz9zUSS7y4P8/m8h/xJxdB9bheAD/IC
 gTdc/+fheFwd6WPDZEf5FfgBeaZUYgug0TUWfo6nrxz8x3Zlw2UqbD0oLiCfnwapgU
 Xg/4BFJdmMWU9QLCPE3W6Tf97vyd1EmUCwCITU2aW+0EyKhgyyXUB7HAmpF8pKPJhe
 SJ18D61bE1GKl42Tb5MFF0T89O4J58v7wwoviMGEx5AlPAGfwtLTDoBAryfnaxPW+S
 atuphoARHOUK0EF/IET7dggFSL9wXlkgA86zFgHj4ZljnzxjDRn3jbtZQ+toz7ai4Q
 OJnnat09fUbDw==
Received: by mail.tasknomic.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Aug 2025 07:40:20 GMT
Message-ID: <20250805084500-0.1.kg.1fbgr.0.ljbe09tvnk@tasknomic.com>
Date: Tue,  5 Aug 2025 07:40:20 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.tasknomic.com
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Do you offer a seat for corridors or waiting rooms? The
 shortest possible length is about 12 cm,
 with a wide range of practical dimensions, 
 with a little over a centimeter of space - with a small, large, large roof.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [141.95.16.86 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ujCJv-0007oe-Ts
Subject: [f2fs-dev] Equipment - chairs
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
From: Jon Brennan via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jon Brennan <jon.brennan@tasknomic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Do you offer a seat for corridors or waiting rooms?

The shortest possible length is about 12 cm, with a wide range of practical dimensions, with a little over a centimeter of space - with a small, large, large roof.

This is a solid and convenient solution that can be selected by furniture distributors, for use in public matters throughout Europe.

I will send you the specification or photos - can our product be used?


Sincerely,
Jon Brennan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
