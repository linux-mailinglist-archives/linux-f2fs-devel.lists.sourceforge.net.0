Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DD64E678
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 04:48:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p61i4-0003va-QY;
	Fri, 16 Dec 2022 03:48:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p61i2-0003vS-T3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 03:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=07xIwyomg0crIck0R0MlHXyNC6CsCyUV6ff9zKM24Wk=; b=Cyn/Mo2qfPXmT+WTPcZk2Yd+g7
 QQ4z2iL9VC+j5rTOsTNZxN572dKE/aD9Zng/8ZBSdDiXSaNJDzZ9nloNlE3YlPq4680+WONXAHmaz
 e6/jZNOJweVBI+Tvkd8W/uTI6GcTA43BM3GagtFe3DOVdcp5bqXAF/Xz8wVheK0ZfDRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=07xIwyomg0crIck0R0MlHXyNC6CsCyUV6ff9zKM24Wk=; b=ehUflSY6oHNlhhWF3HlqdtDhN9
 L0dnFfI8Nt3VpFl2BLs9YoL5THG6KbVCe5CHQeDMXgnz4o75tTPoxQMRQwFLXU67PyWlsVfw3UVsi
 jrW0rde/Lh2Cnbi9a/JFFf3nVlhXI2e4mbHadaKWMjh6h8tgLaHeU3RS+fjj236ZC+g4=;
Received: from mail-tyzapc01on2098.outbound.protection.outlook.com
 ([40.107.117.98] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p61hy-0004cE-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 03:48:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqxateY0FzZrlg0nd6zO1+CfTw466JZVlslrUyWNqb7cR4j9Q5tTi6xtT4AbdoL1gCsFw03Pn/5WsXkZF6q/ea+0I+W2BA8ktbVDmzqvV7Gjg+B3p5XeHuPJqlPooIGGZ0MGI1QxwuLViSIsXIcMKm309nVew7FN/puvXcCuHBqUgnPOFuq4xIXxC/3J06JEFfS4OH+fE3A2f2znZxZt9oGZX0yjV2gz6q6fJSYi8S91YIvf4LAe72MOpoMfy+t25pXZmwR7re88LC2U8LhoIIXvfZjZeQt3rRMiibSKNAeMUYVvrtQiR7QD+gu2oljqUwqjtMXf6RhlYxO3MgLH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07xIwyomg0crIck0R0MlHXyNC6CsCyUV6ff9zKM24Wk=;
 b=Co60kp9DDAq64nU6oIhi6YNoRPxg0YIUHW1GLG3UTXMVqkTrKuSKclszaJCwmsGmgNAow/Oj5fsTxE7GBO99QZel3evRYVhZy6d797/L0Zk1m/CFSoGGjnG+vIepcKyFptXu3IpMC4x0bHg5+aVw/fYfXMGAlzB9+rLgYPaRzKdr9kdYtNnHLA7FUqTeriaRwHdiBwT6euouPeaGBcj4LzaJSe/IT1wG7WiuLI4gy7SxNMBHu1vEk5Pn+Wm+9Z4Gqx72B5u3HjoVaJ/sXL+23uoTylE5huFacly+Uwg6nqH2NDCgJNcfZslX/8w4AeclHTOuLFIHJmW8GXn9bYgvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07xIwyomg0crIck0R0MlHXyNC6CsCyUV6ff9zKM24Wk=;
 b=M4GASpWnyDXV1a4hb8oNq0P07zebVhobSdFcD3a9fm5GQKD2NPEY5bo0PyuL13nd0ma6c2w5FQJas4qQ1xg/t/TR4GnVygqlUGnW/W1Vg0ugKKlLWhaDMLmXpxgZm1qBUGJQlGCTzVLaAKGXIHZLGB7wZdEUAgsYDnI4JO9fStcZx8Tr7P6MrM2YbVsaR2tQp2qyHVwZAIgxlh4sNvYhGaclYx0W+DVTV0C+5xxaiQb7Jd7SImXFstIT1XBugW2qdkHkPHQzcVHYQidtEUUR/SF1LlIBBYMY+ztqpYSx0dV4B/TH7/ecxX+0K4jMA/lyAEh+iFFfkkMy5H+MRWHpFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4283.apcprd06.prod.outlook.com (2603:1096:4:15b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 03:48:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 03:48:18 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 16 Dec 2022 11:48:11 +0800
Message-Id: <20221216034811.4603-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <dedae282-2d13-cc12-95b8-98cfd377d98c@kernel.org>
References: <dedae282-2d13-cc12-95b8-98cfd377d98c@kernel.org>
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f54ac54-3a56-4e1c-0524-08dadf185e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFokE8k8kn05cuBOfyqCBWAFFcOc3aNCRNXYn1pIZQ97faC1HTFq2IozzyX/8SxjBu0EX0bx20BFxH3+u+0PRWdRcizdkmXW9NLmZ5yhMqfbPhI4OmCXJdDZuTJwhBv9io16GtBjniSajgVBtHjOUo9O5BsLZ1OB6Rrmtndqmz/ky7DCOEmdNjZyGHTv0TE6txYrQTv0GM0oJA9gmo1izy4FR3febPMvL0Lelvd3pPjuAOjjxlnzUPOhM8DAzWbNSSqJ72kwhacERPgoTEqMW+vdLv1TVc8AG7/FcaXGXVjJKM/dtxlKBIdHscf3l3bKYMgXqyNdDTiClo0XC7guSIFyeFSclV7OY5lv0vupKTOfDNh2wO/dw4cJbFfFlcASwzJZRzRoqr4OPUZlbOQ3QE4LjK1oPOEuCiI54PLFDXaXh8fQ/XMQtbzbko0/bUoG1TWdKEY7xrehHq8SCTJh7AcG351eOUkyGFL4c/oQruMX443WoxppUlJEeoibGJqJuY2DkLeHLo8IMudbYZYUUyKwVNnR25PYI1iRk6Aq1mts/cuWbDDBy2ImehXzzpiIHGkIS2biiSVis5zfyvGgX5WhL8/daxVcTV+HmHJH1AlEgzkO3tUTVK9V0iL5dLwy0mMS4+ByzI9r0FpR89agEKoiGenS6n7XVZLASJ+r+xDOj7nZrT5FmQCRF05GgWdtl5YE2QOCW3pqVBuxYFf1iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(6666004)(26005)(6486002)(478600001)(6506007)(52116002)(2906002)(186003)(6512007)(86362001)(83380400001)(38350700002)(38100700002)(316002)(66556008)(66476007)(1076003)(66946007)(2616005)(8676002)(4326008)(8936002)(36756003)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b8SGHTKucZCFGyQptmhTQyt6TSS0E1X69dG6xLQ5mtcGIPxCm+o2l5TD/ZT7?=
 =?us-ascii?Q?TRIPP6rhI0fy5aYEKRhNaxX0AzOzYBcwf3owDlZkXqyC2ZU9t+HpNAFW8MDS?=
 =?us-ascii?Q?DuC6uQmbDjZ1gF51dpLUK8GWldFeuEconiWzel7qwCmGIxbzbYw92eMwu8Va?=
 =?us-ascii?Q?RZFiovxMUhcPUyjvLa/yEmDmJsx1yquYhGN8gKrh5XYeRgjs34KaKJ8j+Zwb?=
 =?us-ascii?Q?FBfO0B7UFHGntlqaePE9sAPh7qPqLGjhbVTk1cPR7/xe2OceoEDzYKCoivKs?=
 =?us-ascii?Q?hWFXAHM7musldCFoaE0euHl97k/mI4LeUeaob77IfEwmDcTUA60QgOGpI5SO?=
 =?us-ascii?Q?YL6lyJVYvp9thQGp37/XQ4G8ks2Xz0irTmtgr1Z4bqXCCE6opcXWuCZkTTt0?=
 =?us-ascii?Q?dOZ5iw5qoeVttpEKHmVtfmOgJcK6zlnjHGB06o9axO9xPtykBymHuAmaNayJ?=
 =?us-ascii?Q?K3kBsXGSWsJIXIZzOTwP93UCIEMIwA9AQv4lNiSwUatwe2Fv7F/atZh6yZIp?=
 =?us-ascii?Q?vTOjeEiqiWq+MfZ/dQmLP1msq6HeRwqoNxEuEY9UtgxQ4yQXi+atVNaUgnT3?=
 =?us-ascii?Q?NxqWKRr1B8GbhA7G4PhAqrT5NsjLbN63+Ln/MIX9wmDY2wZcsoWGc1n0kGcZ?=
 =?us-ascii?Q?n8QXPG+Wu38b/Y2oqASr/h3/dlKAEId+TPvRFA9ULF6adLiMS1NhHHIELWBS?=
 =?us-ascii?Q?m1Q/VWtPpNIuq0NIZUMkhT6lU4JAKzHpd8cJYP4IhO0yXHKF14mslnNnA0pN?=
 =?us-ascii?Q?DriZsNsGCx75hTRmDFedzqtFqEJJZA5cNRHTVhR/vF/mx2JTXZM9efsuCXpF?=
 =?us-ascii?Q?B2uOs7Sljb8MkCjOo4kEs9WrJd7KurLszUPX31TKbQFYWqemGLnIKoxLpA8S?=
 =?us-ascii?Q?GuDIdlOJyrpxtOAsCs7jcxtmyqD5/JwDNbVNlOd4PiBypxPZ1u8ti/8XyZCe?=
 =?us-ascii?Q?SHmNY/X+l81WNjaIaYRn5hRD9ASl99U7ESz9gT04Ax4YbeW0LHOqT9nWeYvB?=
 =?us-ascii?Q?0kZ6C7fk7Lw3sENRrXScgpOAo7R8upNq30oLEVMDtUjr7cO9F8szIpGVCcSI?=
 =?us-ascii?Q?tsbvWTH4uW73AlDPg59Ym1uQ4gBD3IZ7IJ6e0sMSfj/ru+bStfjMzvcwjWOE?=
 =?us-ascii?Q?qo/GvqCybBvTB3UUDW42nin2rYyVORxFPewLmb+gcuR3v48JgRi1ScxqkqD1?=
 =?us-ascii?Q?Sej3ftiRcxILZqIISXaOb+I7ZIaHzFdW3GC+SFo9WySJ+AP764TCLx7v2KfC?=
 =?us-ascii?Q?NnLe+rhNpUu5p3laC4DRSaJ5rtgXzjzIW0skpcaYJSK8SrB3nTsjhT274G7m?=
 =?us-ascii?Q?uIv64iOk5EGPw7Gafqqyh2xvgdHPlcqPbN6FEJm/wvAykcpQ/QPmBJ2pAGAv?=
 =?us-ascii?Q?o6HGQQG3Dn5v97qKcG8z2MguKumcYWkkDrbShCCReJ2zAz2hx0/9mcQjbDmG?=
 =?us-ascii?Q?kMa3kY6VEiWQqvnhv1c4FsAAl+3wrdpce7ZHgCf2rW3494gIz0k6udU6cpfN?=
 =?us-ascii?Q?TN/DywTZ+aa/+yEtDeuPRag8B293syvJQUg31QpR0oCa0+VZrI53EbqR7aMN?=
 =?us-ascii?Q?Bn9U2fIlBYeCieG5eNW24cdl0OF9v/QJ5/YJERD5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f54ac54-3a56-4e1c-0524-08dadf185e6e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 03:48:18.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI4rDmsq912CZZ7HjupRjbEMyELT8M91c5yRBVFtPFWZp9Dsg94ggiSxEACq99j8/vNKMRBALdveDLmxcv5ToQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4283
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > After moving f2fs_show_injection_info() core functionality
 into time_to_inject(), > __builtin_return_address(0) result changes from
 return address of caller of > f2fs_show_injection_info() to return [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.98 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.98 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p61hy-0004cE-Fe
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge f2fs_show_injection_info() into
 time_to_inject()
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> After moving f2fs_show_injection_info() core functionality into time_to_inject(),
> __builtin_return_address(0) result changes from return address of caller of
> f2fs_show_injection_info() to return address of time_to_inject().

I tried the __builtin_return_address(1) parameter just now, and no error
was reported when compiling, but a null pointer problem will be triggered
when the kernel is running.

I thought about it, and the print address didn't seem clear enough.
Let's just print the line number of the caller?

#define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__, __LINE__)
static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
                                    const char *func_name, unsigned int line)
{
    struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;

    if (!ffi->inject_rate)
        return false;

    if (!IS_FAULT_SET(ffi, type))
        return false;

    atomic_inc(&ffi->inject_ops);
    if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
        atomic_set(&ffi->inject_ops, 0);
        printk_ratelimited("%sF2FS-fs (%s) : inject %s in [%s] %d\n",
            KERN_INFO, sbi->sb->s_id, f2fs_fault_name[type],
            func_name, line);
        return true;
    }
    return false;
}

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
