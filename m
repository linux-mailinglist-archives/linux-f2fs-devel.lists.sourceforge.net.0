Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6F97B958
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 10:28:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqq3F-0001xW-Sn;
	Wed, 18 Sep 2024 08:28:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1sqq3E-0001xO-6Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 08:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zryOCH+ypVg+hR+D8adaW59oCZj6H096VSN9aNr11fo=; b=DHXZJ7UqFhi932NuqtJ9lHHlr4
 qR9QWO9zGl0fYKLizU06HdUBpFmBy2XtgBbtva7xSwaiYqJl1TjJ7zFpljhoyKNppLB6FPVpWz8Cs
 RF2WvivdIuKskFwfEpOpuIZbxJ4oid6GSc1w3E1ib2f8A/Qpqgd5bo7pj0z0SfmBQdSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zryOCH+ypVg+hR+D8adaW59oCZj6H096VSN9aNr11fo=; b=B
 gL6qjLkVbMyHl6G6WYixrrxBWq3RY+lF3gL31goyH0/9GicxujscRPwc/IpPO+EHYu6Hcob4ws74l
 47akH/l8J45IK6lpcjoDAP62NkQ0weWI+7qFGvHEqoTAXCcmDB0gVoAsWVu6t+jIlXqtjANyEPAHL
 ME2JpqN0KA3Ye1ZQ=;
Received: from mail-psaapc01on2074.outbound.protection.outlook.com
 ([40.107.255.74] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqq3D-00058l-73 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 08:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKpEHB57VzrEFjE/HTgZ4nVs5AS7slOtaA7UhBT7FsuEv/h1JkWmkB04jwH+0Y2OfKEwgi99NcKadN05ClVuSD2GruaitZAH0BpLPmF7Uaj/0dp0s5eCWbgaIkfHQo3FHxEUMW4cJrCTYYW5erHiP+0nsQcScfJZ2+kyDu9cR6MWf0vh+z+gLtrdaUAjqgeaRZIWOGVJFGVUea++spYu67eox/RCPWSJQfKsYwL+8/c4PbhWKCqYTkka2La65ZLegE8oeMiOpe5dhikGlPGY0kOHe4ZQ1y76SWEktzaJnd9BGDrW6y96tUo3jcjHKIinVvaQnS0wi51R+SAwAXsbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zryOCH+ypVg+hR+D8adaW59oCZj6H096VSN9aNr11fo=;
 b=IeABon6uQbR+s4of2/gml1zW8CwKqwefXPA1v+OIjrmVXImCwv2RFxXjGBGDiIb7SM9qfsmsUDVxs8rknzao15Up7EnV/hfNDqnNpajs5xrT8BeN6yAmEa/0/H33JPq+eDk47CP+68zOX21Df5EkUNHpb4DoqD4jjgfF+F3pR+fZwc9XpUGjaEKDBGvZnwjFv/llcpS7vDcZTg/M/yTkI7dI/KX8ky89OyKDRS9reC6wi6iv+yZN6mwlSItuJjmtpV0b1uDCHpC6RGCZ2fdh/ce1MA0XmCuqFLjo4P8S1bvpSUxs8kNpddGQz/fqldmyN1S37efI5TXzdme9wYSS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zryOCH+ypVg+hR+D8adaW59oCZj6H096VSN9aNr11fo=;
 b=TiKM9U5MDf1Wa+rVWY2SCHDHyoNxIn+hYNwey0gYPZLctBAG4Qt1lqdaF9IX1NGR55wzF1GYj8E7E+Iu1giQQ9F28ehsQBROM/bplKe56oe0Q/AEXTUALZEpTwBgQRgAjA+LmMkabEy3Hw87nk61GhSQWMRcGKWzWgj2e2QKBU3bBiq1ukImhn7D+gDP3k3rUa9wuXYVlUPPrQ1cJ3UJO+aM6nYxqcBI6XRbCmMzWxC6zzzEX0/F3sMQkSq9N2ZQ7G+i21/iLZ2K+Twi1FmrgtEact/HMK891jRT5qJFZaEfed39QBMNBJMZEiuFF2VZgV4oCLrwlbNhISNtNmjTTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by TYZPR06MB5999.apcprd06.prod.outlook.com (2603:1096:400:33d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 08:28:26 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 08:28:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 18 Sep 2024 02:44:00 -0600
Message-Id: <20240918084400.1821317-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|TYZPR06MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c7a89c-b76b-43c6-e39c-08dcd7bbddc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Ge29ORgkA3A5MVFMJRKZXj6npyAQ3Cj3SpdtqYofcHEsTraS1kYIq5CDriO?=
 =?us-ascii?Q?vTmQjuci1HQRqySGohL8Bsvg2RquY3h0dJSsjuSBXSrm58L7vhxBP7skEAX/?=
 =?us-ascii?Q?FvbcczuDab8cUNyo5FV14bGO+qtsMbJeu5Qp8uBR2HnTxKmd8L7n1UByPgQQ?=
 =?us-ascii?Q?i+xvoBYt36L8JEgEylH0dctiz55WCzbZUqjkB1iTFqUQPJrLuCoufFReDnGC?=
 =?us-ascii?Q?JacmiQFLpdbimKiXMs7z/uG2y/X/thKxccjmmZH4drfevsroM6bxR++N8kQf?=
 =?us-ascii?Q?DS6ICptmGCd6RxfyZZd7sIJQ7Lf2B1D6YQAryCAbStU0NtFG4kJGqkrn7KH7?=
 =?us-ascii?Q?DiNdWTcMigolyhP7To9ywMiyUUt0dAyKHd/OKDJy6E1cn7VqbfjIXuMch9q1?=
 =?us-ascii?Q?m+MZS3CwkBQ9Hb6iIhtS/t66Hu92Cy2IFSiIGxAZsH/kUIM+z55UP6wkPLs/?=
 =?us-ascii?Q?q3GT8hlLi27iOnTkRWI09jvUsayIWht4URY6wGvUibk1/Ww0oR5YGL3WoZ78?=
 =?us-ascii?Q?HrQ4EgcgysU1meo7jR6oFEjIU3DgeiNXxSOQnE1hWcJG82zx/cX6UYo8d4AS?=
 =?us-ascii?Q?H9xLMgtWsvPwlSd7DB6gxlt7fGoKQ9MjZ8Em+yaVmYQvwWEk+PoT4H/GLzp3?=
 =?us-ascii?Q?Hm/F6lhJs5iFxxM9gMFtYSXe0Kt028UPzmwef8emvOsZCj7T5/hl0dA5Exi1?=
 =?us-ascii?Q?Vw6PYIBo1gm3ywQ4DvI3nj4Kg6FiXSVBDpMWQu3pJSsJPYq6iZg6Acj9gJ2U?=
 =?us-ascii?Q?8Pv4eR1k69du75GUDrCkTdGN3RFIjG+R5J5qZcBkVwnAAW1w2CBOwZ3cIJkC?=
 =?us-ascii?Q?NHOV3Ksf4lhZlWx4pzqgU9F5CUtkkc1qkmYweg/XtdHKlQ3k3AA/NzwkTB7s?=
 =?us-ascii?Q?9c6pnu+QCvABv4UkCm9zM2KJuQk7wHhGwW2Sis8eAsQKv2OfL/35NT8SSa2k?=
 =?us-ascii?Q?4pKSYmc0+vXEwJQqRQd2PkkS7jabxWWz0yd6E+oVX+zzL+7GrCywrks2g2b8?=
 =?us-ascii?Q?bN7FR2SNHhBqEDB7/GV7fxtaoHkZIexTmFWOV0ANRKSXwJ0O6GIWA3TMnwcz?=
 =?us-ascii?Q?Mc7hceZ5dh0ZzL7fJkvYuL4om51C362WnDVaO+0OiGzPsTrCetdGk2oIkvjz?=
 =?us-ascii?Q?g3/sP0Wd54JSuBnkZEfTxb/FsA7evEWEITFO60Dgfd+UXtb3AaopTggLzKjK?=
 =?us-ascii?Q?pIgzUk4+CTBCKIjD0sc2gGjlLBIGe4gML005yvAbiVu5BOhP4ZrwmJBDhez1?=
 =?us-ascii?Q?+UlOnE2eTT55NTKZPozk4Gxel/6fP91LwHgSeuuXBP+1xJNXRAJXPdXwVbqj?=
 =?us-ascii?Q?NE+2eshB511wdUcNH5vDvuGLUVQ+NFys2d69royY23d7PA6RDRD1EoUjffBd?=
 =?us-ascii?Q?F5luEye84nSgFgZJE1vqALWjLqxjS5Hh6wWPNxjWuTDJyk69tw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s9RTGKfYjEApCG6ZWVi/S8Ugs8gZbl526K3NN/Viqc/LsHDyN2n53Msb0o13?=
 =?us-ascii?Q?kn//NmCLPLYsy/wGP51nZUJA8GESmETw69n9dRgBKRSRGYj+yNv/E0L5sz1N?=
 =?us-ascii?Q?PYUqkphCidKzfIsqBBtA4dwhFmSaF5bdiom9iAx12sT1ZFAb1k+H+dBdgDlc?=
 =?us-ascii?Q?w4gfGb5Gpoik/WtePal+2vr9/dnVgUMHKPMn1O9Ezzfa06uvH4u7rDk9BVqx?=
 =?us-ascii?Q?dd5uSzxpLRlGJW6j6nCAM9a3ZtlEWnz9wF1CwXk2wva9AkDbbRVZJv2UsZyO?=
 =?us-ascii?Q?V/6a2SmumfO/k3dD9OEZgp0Me7jvnOV+LdTXS7YXc4vsZ1oT1p88S/x6Hy2c?=
 =?us-ascii?Q?rmb3nCos8+cRI4BRgNuktBSpTQo2FmdsgqMk12dkMQEYXLdi6OanGKO6Z15U?=
 =?us-ascii?Q?w/MfKXDoYjBL4uWTLQF82kK7b59II2Ctyy+Y9Py/0dEA9gRpbKqDUfM/XbuT?=
 =?us-ascii?Q?F6QmfPNuTudzTQHuuJcaCcE6Kg4LkcZS5TEScMt1R3XJwnKGbk3meaIPR66O?=
 =?us-ascii?Q?z8bR0bBBBF8xzOglgi0rmYA+2cRNfeXUYYyzxB4PdNTSUqrBMAYmPU8e5KKH?=
 =?us-ascii?Q?sa9cLk6qmuK1aIQz+cKA5vRMx9jWY4TA8JLqnkENzD8W9bjeKb9o5+PELNfw?=
 =?us-ascii?Q?Qb/GcsFo2OklHxXiwcGbtXB6k0UYIdIVDk6KV0OZWGexiG8FOpsWkb9fbBkH?=
 =?us-ascii?Q?UNbmXJHehTj/7d0X9wBKmsCxVQMHQfSNpfmtEug8K+tOfrOORn/81PklpQ+E?=
 =?us-ascii?Q?ox7FDcI67IqccZfE6uoLr3r5xezar35WWKs3e0giitorsH82rpq+nlCeaSxG?=
 =?us-ascii?Q?aUmassVZwbMgVzp5e4qXSRhk10YdiehvglmBxNHqwt1/lkYP5rZntbanS1OK?=
 =?us-ascii?Q?MEy0QrHlcLNink2DVckH9CHvnMFlzGlAQuDEGoujMyM3ic8QjUvxvtjnqusT?=
 =?us-ascii?Q?mCKMRpYp9HT09HRpRp7Tb22DbZPisA9cT001qRiNWxsnznm6nyigTgyfjw/4?=
 =?us-ascii?Q?sGb2VkMgmctKrqWYQqR2k0NhNni3FWWP66uXmq/ldDpANQUjxREvHF6ZWi2e?=
 =?us-ascii?Q?Ab4b5nvm9fqRsDDQr8uaWOf0WF4vkjIKKYosxoqdkbBioOGckSztVXlqIoXq?=
 =?us-ascii?Q?jFbuVd7Zd3LV2HCxKpW/5sWRdCpFAgqwUT4GwU4EUDk8ZbRDLa49qb24JZAy?=
 =?us-ascii?Q?H75+Vt/ACjDVoUxPRpVnjPfAGVhzW+o1r4FRm0kZPcVkPb0zA8vplEpF5kWE?=
 =?us-ascii?Q?b0XmppVP5j0ehqQTYvVatDEouIRmKZyqJJ/0fWIsVHf8DLnMli1LCe3ViRpW?=
 =?us-ascii?Q?8xeuGrn85+uvQM0RzZ1Wd79l8eYLgA+Kr0h0kvPkvYmwpPGx7UZ/SVHoScD3?=
 =?us-ascii?Q?D/25TcYeLFlNn/K0ZBNXM1eJd2vR0Vr3NMMqkdp0B9okcbsOOiqr2UVmzzvQ?=
 =?us-ascii?Q?ucYOkkfT5Ufkx8jjhU8ufBC0536Or/Po+DMt5GpJh+CrO0Krs/ZDiUosVHzO?=
 =?us-ascii?Q?XS1duhhCUMxgCmfUXyVI0ty2U9XNcu3jyqr1fV62cBW7KSbeRuCRYnGuQMw4?=
 =?us-ascii?Q?fv7Zh4KcYSaVOnghiNGxNi+eopx2pWu8krDOwy3J?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c7a89c-b76b-43c6-e39c-08dcd7bbddc6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 08:28:26.1349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hZMl7/2800xU/dNqpBSEbXTR0juxMHBrlOpYQ04lgkINYDz9eZ0wk6yYz1kLUNZPGX9whLw1MGF5tjA11a65A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5999
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  creating a large files during checkpoint disable until it
 runs out of space and then delete it, then remount to enable checkpoint again, 
 and then unmount the filesystem triggers the f2fs_bug_on as bel [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sqq3D-00058l-73
Subject: [f2fs-dev] [PATCH] f2fs: fix f2fs_bug_on when uninstalling
 filesystem call f2fs_evict_inode.
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
From: Qi Han via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Han <hanqi@vivo.com>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

creating a large files during checkpoint disable until it runs out of
space and then delete it, then remount to enable checkpoint again, and
then unmount the filesystem triggers the f2fs_bug_on as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/inode.c:896!
CPU: 2 UID: 0 PID: 1286 Comm: umount Not tainted 6.11.0-rc7-dirty #360
Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
RIP: 0010:f2fs_evict_inode+0x58c/0x610
Call Trace:
 __die_body+0x15/0x60
 die+0x33/0x50
 do_trap+0x10a/0x120
 f2fs_evict_inode+0x58c/0x610
 do_error_trap+0x60/0x80
 f2fs_evict_inode+0x58c/0x610
 exc_invalid_op+0x53/0x60
 f2fs_evict_inode+0x58c/0x610
 asm_exc_invalid_op+0x16/0x20
 f2fs_evict_inode+0x58c/0x610
 evict+0x101/0x260
 dispose_list+0x30/0x50
 evict_inodes+0x140/0x190
 generic_shutdown_super+0x2f/0x150
 kill_block_super+0x11/0x40
 kill_f2fs_super+0x7d/0x140
 deactivate_locked_super+0x2a/0x70
 cleanup_mnt+0xb3/0x140
 task_work_run+0x61/0x90

The root cause is: creating large files during disable checkpoint
period results in not enough free segments, so when writing back root
inode will failed in f2fs_enable_checkpoint. When umount the file
system after enabling checkpoint, the root inode is dirty in
f2fs_evict_inode function, which triggers BUG_ON. The steps to
reproduce are as follows:

dd if=/dev/zero of=f2fs.img bs=1M count=55
mount f2fs.img f2fs_dir -o checkpoint=disable:10%
dd if=/dev/zero of=big bs=1M count=50
sync
rm big
mount -o remount,checkpoint=enable f2fs_dir
umount f2fs_dir

Let's redirty inode when there is not free segments during checkpoint
is disable.

Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index aef57172014f..1ff391520cd9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -770,8 +770,10 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 		!is_inode_flag_set(inode, FI_DIRTY_INODE))
 		return 0;
 
-	if (!f2fs_is_checkpoint_ready(sbi))
+	if (!f2fs_is_checkpoint_ready(sbi)) {
+		f2fs_mark_inode_dirty_sync(inode, true);
 		return -ENOSPC;
+	}
 
 	/*
 	 * We need to balance fs here to prevent from producing dirty node pages
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
