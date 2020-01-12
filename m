Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494B138538
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Jan 2020 06:59:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iqWHE-0000OK-Su; Sun, 12 Jan 2020 05:59:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterwong@hsbc.com.hk>) id 1iqWHD-0000OD-T7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Jan 2020 05:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:Message-ID:To:Reply-To:From:Date:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YEKdjzbrqrhX2XrCDPgbg4tmyxe9e05NQ4A2cIf4Bjw=; b=mYkroghEp88H+02xxujLjHZxQ2
 4jrT0z1V+y361pdhQhhw+H/i5ilj8WGhHpsr/GKtegxhgCz3IlvFwgjQEK/XAx5lI6HXmobIwc8uR
 AhZXRSetYIoTCbR9JMVe4NFQ/ov4nGjwdRtuXKlhwbKDeRIlFEidv38fh1vJMkGqeTUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:To
 :Reply-To:From:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YEKdjzbrqrhX2XrCDPgbg4tmyxe9e05NQ4A2cIf4Bjw=; b=g
 /90TtorqQseH6nXGT1HVnN/q52WGhdEed31ZrwiTfjFoVQecQwtxad4gKVjR/Ttpy+0kopY8HdF3z
 psM2HlL/+nmJCir/v/c5slXkW2veyYEr3G6jH9TcuPaFXvMLHAlGmSo/kTPR2GGscN9gGLsPVaJeH
 nBiU4X6r6lknyS/A=;
Received: from mail3.iservicesmail.com ([217.130.24.75])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iqWHB-00HLT3-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Jan 2020 05:59:07 +0000
IronPort-SDR: Ii+soYYYPY/jUoPvFFlt+2aRrDUy3Xnk1qbk22j4QN6nDBSxkajDmP7ACFQodR+732sWULIQ5Y
 1aqqCWsQ9GLQ==
IronPort-PHdr: =?us-ascii?q?9a23=3AisYNdBSolfruI1+9tBgD/p5fYNpsv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa6zZhKN2/xhgRfzUJnB7Loc0qyK6vumAzJeqsfZ+Fk5M7V0Hy?=
 =?us-ascii?q?cfjssXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFR?=
 =?us-ascii?q?rwLxd6KfroEYDOkcu3y/qy+5rOaAlUmTaxe7x/IAi4oAnLqMUbgIpvJqk1xx?=
 =?us-ascii?q?fVv3BFZ/lYyWR0KFyJgh3y/N2w/Jlt8yRRv/Iu6ctNWrjkcqo7ULJVEi0oP3?=
 =?us-ascii?q?g668P3uxbDSxCP5mYHXWUNjhVIGQnF4wrkUZr3ryD3q/By2CiePc3xULA0RT?=
 =?us-ascii?q?Gv5LplRRP0lCsKMSMy/GfQhsJtkK1Uuhehphxmz4PKZ4GVLuJ+fqTHfdwAWW?=
 =?us-ascii?q?pOQN9dWDJHAo+lc4YPE/YBMvxEoIn9uVQOqAWxBQ+wBO/21DBIgGb606o90+?=
 =?us-ascii?q?QnDw7H3BUsEMwIsH/JqNn4OrseXfywwKTO0D7Nbe5Z2S3l5YbGch4hu++CU7?=
 =?us-ascii?q?Ftf8Xe1UYhGBjIjkmSpIP5Iz+ZyvgBv3ad4uF9VeyvkWknqwRprza12Mgslp?=
 =?us-ascii?q?fGhpgIwV/E8iV5xok1LsC/RU5jf9GkDIVftzuUNotxRMMiTHpluCYhyrIdpZ?=
 =?us-ascii?q?G3ZjQFyJMixxLFa/yHcJGF7xT+X+iSOTd1nGxpdK+9ihqo7EStxPHwWtOq3F?=
 =?us-ascii?q?tFtCZInNnBu3YQ3BLJ8MeHUOFy/kK51DaK0ADc9/9LLFgvlareN54h2rkwlo?=
 =?us-ascii?q?cPsUjbHi/5hkH2jKiOe0Uh4Oeo6uDnYq/4qZ+YK4N5hRvyMropmsOiG+s4PA?=
 =?us-ascii?q?8OX26F9uimyrLj5lX1QLRMjvIojqnUqI7WKdkZq6KjHgNY3Jov5wyhAzqpyt?=
 =?us-ascii?q?gVk3kKIEpAeB2djojpP1/OIOr/Dfe6m1msiClkx+zYMb37DJTNKX7DkLj6cL?=
 =?us-ascii?q?Z98E5T0xY8wcpD6JJTD7ENOvLzWkzpuNzCEhA5KxC0w/rgCNhl0oMeWGSPAr?=
 =?us-ascii?q?KWMa/Lv1+E+OwvI/KVaIAIpjn9NeYq5/r1gH89mF8dZrWp3YANZHCjGfRmPl?=
 =?us-ascii?q?+ZbmbyjdcPFmcKpAU+Q/LwhF2ETzFTeyX6Y6Vp4jA9FZLjA93NXcWhjaKM2A?=
 =?us-ascii?q?+/H4ZKfSZdDU2WGnrmcJ+LVrEKZT7BGMJ5li04Uu2ZRpMsz1mRswn1g+5/I/?=
 =?us-ascii?q?bZ4DIfs53j19hu7eb7mhQ79DgyBMOYhTKjVWZxy1sFWzIslJ94p0M1nk+Oza?=
 =?us-ascii?q?VinPteGvRT/PlCFAw9MNjczLopWJjJRgvdc4LQGx6dSdK8DGRqFoo8?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GeAgDttBpelyMYgtlNGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVO?=
 =?us-ascii?q?DBIJLAQEznW4BjQQNDQKFHYJKBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ?=
 =?us-ascii?q?/ARIBbIJIglkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAO?=
 =?us-ascii?q?EToF9ozdXdAGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GeAgDttBpelyMYgtlNGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVODBIJLAQEznW4Bj?=
 =?us-ascii?q?QQNDQKFHYJKBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ/ARIBbIJIglkEj?=
 =?us-ascii?q?UISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAOEToF9ozdXdAGBH?=
 =?us-ascii?q?nEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,424,1571695200"; d="scan'208";a="303962961"
Received: from mailrel04.vodafone.es ([217.130.24.35])
 by mail01.vodafone.es with ESMTP; 12 Jan 2020 06:58:58 +0100
Received: (qmail 24218 invoked from network); 12 Jan 2020 05:00:20 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
 (envelope-sender <peterwong@hsbc.com.hk>)
 by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
 for <linux-f2fs-devel@lists.sourceforge.net>; 12 Jan 2020 05:00:20 -0000
Date: Sun, 12 Jan 2020 06:00:19 +0100 (CET)
From: Peter Wong <peterwong@hsbc.com.hk>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <29591878.460722.1578805219919.JavaMail.cash@217.130.24.55>
MIME-Version: 1.0
X-Spam-Score: 3.6 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?217.130.24.75>]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [217.130.24.75 listed in list.dnswl.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 -1.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iqWHB-00HLT3-Sz
Subject: [f2fs-dev] Investment opportunity
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
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
