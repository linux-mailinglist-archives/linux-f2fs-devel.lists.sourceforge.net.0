Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4190A88
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 23:56:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hykCm-0003Vz-Bf; Fri, 16 Aug 2019 21:56:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <contact@digytag.eu>) id 1hykCl-0003Vt-JG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 21:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Transfer-Encoding:
 Content-Type:Date:Subject:Reply-To:To:Sender:From:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D7DqIBqYuUe8szCR9rjbnsWIO3Om2CpDCfVnUBr6Ews=; b=eQplvBLCHisWNIchpKN0jTFmmT
 DKDlq1nSr1soui7EqgSD8PAhI9/5lfnWwPkk0vu0pvj0VlQfwrDHg9Hz4UY5HrcifDFotZA3WCoid
 WeYjdbixZZig+K4pw3VEh0ETYqI2P+hQmeQSGFUsADkhW+TeDjfypblcfEsUmcT+iWeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Transfer-Encoding:Content-Type:Date:
 Subject:Reply-To:To:Sender:From:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=D7DqIBqYuUe8szCR9rjbnsWIO3Om2CpDCfVnUBr6Ews=; b=l
 Kb3tb6RPcEWAgDzHazfzbCEfDdb+QIHmpWyZgJPBYtPFkTV8OZ4v9QuHLb64C29GYvLkQXJFGPl9N
 2Xk5NpwanAe1bcnbwPB52mUj13EPYhBZERBhqZx1LlsqcKjqTHgFfJFQ48t7bsZWH59bh6eF1O82i
 hGboNDhu3rKEvD90=;
Received: from pop2.ispfr.net ([195.114.18.185] helo=mx3.ispfr.net)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hykCV-005rh9-7E
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 21:56:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by mx3.ispfr.net (Postfix) with ESMTP id 9E1F9C034F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2019 23:39:59 +0200 (CEST)
Received: from localhost ([127.0.0.1])
 by localhost (clmail-smtpmol3.intra [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOD6awvtSiV7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2019 23:39:57 +0200 (CEST)
Received: from localhost (195-114-18-162.ispfr.net [195.114.18.162])
 (Authenticated sender: contact@digytag.eu)
 by mx3.ispfr.net (Postfix) with ESMTPA id 81C73C0324
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2019 23:39:54 +0200 (CEST)
X-Mailer: Postman SMTP 1.7.2 for WordPress
 (https://wordpress.org/plugins/postman-smtp/)
X-WPCF7-Content-Type: text/plain
From: Digytag <contact@digytag.eu>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Aug 2019 21:39:54 +0000
Content-Disposition: inline
MIME-Version: 1.0
Message-ID: <mailbox-26957-1565991597-845@clmail-smtpmol3.intra>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: pizchimapa.gq]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hykCV-005rh9-7E
Subject: [f2fs-dev] Tinder for Adults: The 5 Best Senior Dating Sites
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
Reply-To: info@digytag.eu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Vm90cmUgbWVzc2FnZSA6ClNleHkgZ2lybHMgZm9yIHRoZSBuaWdodCBpbiB5b3VyIHRvd246IGh0
dHA6Ly9waXpjaGltYXBhLmdxL2szMnN4PyZ6aWlscz1zTnlLbHhuenVTVmoKCi0tCkNlY2kgZXN0
IGxhIGNvcGllIGRlIHZvdHJlIG1lc3NhZ2UsIGVudm95w6kgdmlhIGxlIGZvcm11bGFpcmUgZGUg
Y29udGFjdCBkZSBEaWd5dGFnIChodHRwOi8vd3d3LmRpZ3l0YWcuZXUpCgpOb3VzIHZvdXMgZW4g
cmVtZXJjaW9ucyBkJ2F2YW5jZSBldCBub3VzIHJldmllbmRyb25zIHZlcnMgdm91cyB0csOocyBy
YXBpZGVtZW50LgoKRXF1aXBlIERJR1lUQUcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
